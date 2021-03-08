//
//  ViewController.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 06/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var movieSearchConteiner: UIView!
    @IBOutlet private var TitleLabel: UILabel!
    @IBOutlet private var separatorContainer: UIView!
    @IBOutlet private var allMovieTitleLabel: UILabel!
    
    typealias strings = CommonStrings
    
    private var movies: [Movie] = []
    private var movieGenres: [MovieGenre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
    }
    
    private func setup() {
        tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        getMovies(from: strings.MovieApi.baseURL + strings.MovieApi.allMoviesURL)
        getMovieGenres(from: strings.MovieApi.baseURL + strings.MovieApi.movieGenreURL)
    }
    
    private func getMovies(from url: String) {
        movies.removeAll()
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            guard let result = try? JSONDecoder().decode(MovieResponse.self, from: data) else { return }
            self.movies = result.results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).resume()
    }
    
    private func getMovieGenres(from url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            guard let result = try? JSONDecoder().decode(MovieGenreResponse.self, from: data) else { return }
            self.movieGenres = result.genres
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).resume()
    }
    
    private func style() {
        separatorContainer.backgroundColor = UIColor.Primary.mainBlack
        movieSearchConteiner.backgroundColor = UIColor.black
        TitleLabel.text = strings.MainScreen.searchBarText
        TitleLabel.font = Font.Futura.medium(size: 17)
        TitleLabel.textColor = UIColor.white
        allMovieTitleLabel.text = strings.MainScreen.allMovies
        allMovieTitleLabel.textColor = UIColor.white
        allMovieTitleLabel.font = Font.Futura.medium(size: 10)
        allMovieTitleLabel.alpha = 0.5
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let selectedMovie = movies[indexPath.row]
        let viewModel = MovieViewModel(title: selectedMovie.title,
                                       genre: getGenreForMovie(using: selectedMovie.genre_ids.first ?? 0),
                                       poster_path: selectedMovie.poster_path)
        cell.configure(with: viewModel)
        cell.backgroundColor = UIColor.Primary.mainBlack
        cell.selectionStyle = .none
        return cell
    }
    
    private func getGenreForMovie(using movieId: Int) -> String {
        return movieGenres.filter { $0.id == movieId }.first?.name.uppercased() ?? ""
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movieDetails = MovieDetailsViewController(with: movies[indexPath.row])
        movieDetails.modalPresentationStyle = .fullScreen
        movieDetails.loadViewIfNeeded()
        present(movieDetails, animated: true, completion: nil)
    }
}
