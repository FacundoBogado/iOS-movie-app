//
//  MovieDetailsViewController.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 07/03/2021.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController, UITableViewDelegate {
    typealias strings = CommonStrings
    
    @IBOutlet private var movieImageView: UIImageView!
    @IBOutlet private var movieTitle: UILabel!
    @IBOutlet private var movieYear: UILabel!
    @IBOutlet private var buttonContainer: UIView!
    @IBOutlet private var subscribeButton: UIButton!
    @IBOutlet private var overviewContainer: UIView!
    @IBOutlet private var overviewLabel: UILabel!
    @IBOutlet private var movieOverview: UILabel!
    @IBOutlet private var imageBackground: UIImageView!
    @IBOutlet private var backButtonContainer: UIView!
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var overviewTableView: UITableView!
    
    private var model: Movie?
    
    init(with model: Movie) {
        super.init(nibName: nil, bundle: nil)
        configure(with: model)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setup()
    }
    
    func configure(with model: Movie) {
        self.model = model
    }
    
    private func setup() {
        overviewTableView.dataSource = self
        self.overviewLabel.text = strings.LabelText.overview
        self.movieTitle.text = model!.title
        self.movieOverview.text = model!.overview
        self.movieYear.text = model!.release_date.components(separatedBy: "-").first
        self.subscribeButton.setTitle(strings.Buttons.buttonSubscribeDefaultText, for: .normal)
        if let data = try? Data(contentsOf: URL(string: strings.MovieApi.imageURL + model!.poster_path)!) {
            self.movieImageView.image = UIImage(data: data)
            self.imageBackground.image = UIImage(data: data)
            self.imageBackground.contentMode = .scaleToFill
            self.imageBackground.addoverlay(color: (UIImage(data: data)?.averageColor)!, alpha: 0.8)
        }
    }
    
    private func style() {
        overviewContainer.backgroundColor = UIColor.clear
        movieOverview.textColor = UIColor.white
        movieOverview.font = Font.Avenir.medium(size: 14)
        overviewLabel.textColor = UIColor.Primary.blackText
        overviewLabel.font = Font.Futura.bold(size: 12)
        movieTitle.font = Font.Futura.bold(size: 24)
        movieTitle.textColor = UIColor.white
        movieYear.font = Font.Avenir.medium(size: 15)
        movieYear.textColor = UIColor.white
        subscribeButton.titleLabel?.font = Font.Futura.bold(size: 16)
        subscribeButton.setTitleColor(UIColor.white, for: .normal)
        buttonContainer.backgroundColor = UIColor.clear
        buttonContainer.layer.cornerRadius = 30
        buttonContainer.layer.masksToBounds = true
        buttonContainer.layer.borderWidth = 2.0
        buttonContainer.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        backButtonContainer.layer.cornerRadius = backButtonContainer.frame.size.width/2
        backButtonContainer.layer.masksToBounds = true
        backButtonContainer.backgroundColor = UIColor.black
        overviewTableView.backgroundColor = UIColor.clear
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tableViewYPosition = 200 - (scrollView.contentOffset.y + 200)
        let height = max(60, tableViewYPosition)
        let width = max(40, tableViewYPosition)
        let movieFrame = CGRect(x: 0, y: 0, width: width, height: height)
        movieImageView.frame = movieFrame
    }
}
