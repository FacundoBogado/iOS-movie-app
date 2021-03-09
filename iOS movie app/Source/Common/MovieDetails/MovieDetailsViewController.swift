//
//  MovieDetailsViewController.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 07/03/2021.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
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
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    private var model: Movie?
    
    init(with model: Movie){
        super.init(nibName: nil, bundle: nil)
        configure(with: model)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
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
    
    func configure(with model: Movie) {
        self.model = model
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
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
