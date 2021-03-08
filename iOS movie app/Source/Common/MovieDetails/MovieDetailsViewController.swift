//
//  MovieDetailsViewController.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 07/03/2021.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    typealias strings = CommonStrings.MovieApi
    
    @IBOutlet private var movieImageView: UIImageView!
    @IBOutlet private var movieTitle: UILabel!
    @IBOutlet private var movieYear: UILabel!
    @IBOutlet private var buttonContainer: UIView!
    @IBOutlet private var subscribeButton: UIButton!
    @IBOutlet private var overviewContainer: UIView!
    @IBOutlet private var overviewLabel: UILabel!
    @IBOutlet private var movieOverview: UILabel!
    @IBOutlet private var imageBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    init(with model: Movie){
        super.init(nibName: nil, bundle: nil)
        configure(with: model)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(with model: Movie) {
        self.movieTitle.text = model.title
        self.overviewLabel.text = model.overview
        self.movieYear.text = model.release_date
        if let data = try? Data(contentsOf: URL(string: strings.imageURL + model.poster_path)!) {
            self.movieImageView.image = UIImage(data: data)
            self.imageBackground.image = UIImage(data: data)
        }
    }
    
    private func style() { }
}
