//
//  MovieWithButtonTableViewCell.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 10/03/2021.
//

import UIKit

class MovieWithButtonTableViewCell: UITableViewCell {

    @IBOutlet private var movieImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieGenreLabel: UILabel!
    @IBOutlet var separatorView: UIView!
    @IBOutlet var movieSubscribeContainer: UIView!
    @IBOutlet var movieSubscribeButton: UIButton!
    
    typealias strings = CommonStrings
    private var selectedMovie: MovieViewModel?
    
    override func awakeFromNib() {
        style()
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieWithButtonTableViewCell", bundle: nil)
    }
    
    func configure(with model: MovieViewModel) {
        selectedMovie = model
        self.movieGenreLabel.text = model.genre
        self.movieTitleLabel.text = model.title
        self.movieSubscribeButton.setTitle(strings.Buttons.buttonAddMovie, for: .normal)
        if let data = try? Data(contentsOf: URL(string: strings.MovieApi.imageURL + model.poster_path)!) {
            self.movieImageView.image = UIImage(data: data )
        }
    }
    
    private func style() {
        movieTitleLabel.font = Font.Futura.bold(size: 18)
        movieTitleLabel.textColor = UIColor.white
        movieGenreLabel.font = Font.Avenir.medium(size: 13)
        movieGenreLabel.textColor = UIColor.white
        movieGenreLabel.alpha = 0.5
        separatorView.backgroundColor = UIColor.Primary.grey
        movieSubscribeButton.titleLabel?.font = Font.Avenir.medium(size: 10)
        movieSubscribeButton.setTitleColor(UIColor.white, for: .normal)
        movieSubscribeButton.alpha = 0.3
        movieSubscribeContainer.backgroundColor = UIColor.Primary.mainBlack
        movieSubscribeContainer.layer.cornerRadius = 5
        movieSubscribeContainer.layer.masksToBounds = true
        movieSubscribeContainer.layer.borderWidth = 2.0
        movieSubscribeContainer.layer.borderColor = UIColor(white: 1.0, alpha: 0.3).cgColor
    }
    
    @IBAction func didTapSubscribeButton(_ sender: Any) {
        self.movieSubscribeButton.setTitle(strings.Buttons.buttonAddedMovie, for: .normal)
        movieSubscribeContainer.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        movieSubscribeButton.titleLabel?.font = Font.Avenir.medium(size: 10)
        movieSubscribeButton.setTitleColor(UIColor.black, for: .normal)
        movieSubscribeButton.alpha = 1
    }
}
