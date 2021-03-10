//
//  SearchMovieViewController.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 08/03/2021.
//

import UIKit

class SearchMovieViewController : UIViewController {
    
    @IBOutlet private var searchbarContainer: UIView!
    @IBOutlet private var cancelButton: UIButton!
    @IBOutlet private var moviesTableView: UITableView!
    @IBOutlet private var movieSearchBar: UISearchBar!
    
    private var movies: [MovieViewModel]?
    private var filteredMovies: [MovieViewModel]?
    
    init(with viewModel: [MovieViewModel]) {
        super.init(nibName: nil, bundle: nil)
        configure(with: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        moviesTableView.register(MovieWithButtonTableViewCell.nib(), forCellReuseIdentifier: "MovieWithButtonTableViewCell")
        moviesTableView.dataSource = self
        movieSearchBar.delegate = self
    }
    
    func configure(with model: [MovieViewModel]) {
        self.movies = model
    }
    
    private func style() {
        searchbarContainer.backgroundColor = UIColor.black
        cancelButton.setTitle("Cancel", for: .normal)
        movieSearchBar.barStyle = .black
        movieSearchBar.searchBarStyle = .minimal
        moviesTableView.backgroundColor = UIColor.Primary.mainBlack
    }
    
    @IBAction func didTapCancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchMovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let filteredMovieArray = filteredMovies, filteredMovieArray.count > 0 {
            return filteredMovieArray.count
        } else {
            return movies!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieWithButtonTableViewCell", for: indexPath) as! MovieWithButtonTableViewCell
        
        if let filteredMovieArray = filteredMovies, filteredMovieArray.count > 0 {
            cell.configure(with: filteredMovieArray[indexPath.row])
        } else {
            cell.configure(with: movies![indexPath.row])
        }
        
        cell.backgroundColor = UIColor.Primary.mainBlack
        cell.selectionStyle = .none
        return cell
    }
}

extension SearchMovieViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMovies = movies?.filter {$0.title.prefix(searchText.count) == searchText}
        moviesTableView.reloadData()
    }
}
