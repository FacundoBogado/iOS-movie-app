//
//  MovieTableViewCell.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 07/03/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private var movieImageView: UIImageView!
    @IBOutlet private var movieGenreLabel: UILabel!
    @IBOutlet private var movieTitleLabel: UILabel!
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var movieContentView: UIView!
    
    typealias strings = CommonStrings.MovieApi
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
    
    func configure(with model: MovieViewModel) {
        selectedMovie = model
        self.movieGenreLabel.text = model.genre
        self.movieTitleLabel.text = model.title
        
        if let data = try? Data(contentsOf: URL(string: strings.imageURL + model.poster_path)!) {
            self.movieImageView.image = UIImage(data: data )
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    private func style() {
        movieImageView.contentMode = .scaleToFill
        movieImageView.addoverlay(color: UIColor.Primary.secondaryBlack, alpha: 0.9)
        containerView.backgroundColor = UIColor.Primary.secondaryBlack.withAlphaComponent(0.5)
        movieGenreLabel.font = Font.Futura.bold(size: 12)
        movieTitleLabel.font = Font.Futura.bold(size: 16)
        movieTitleLabel.textColor = UIColor.Primary.iceBlue
        movieGenreLabel.textColor = UIColor.Primary.iceBlue
        containerView.layer.cornerRadius = 5;
        containerView.layer.masksToBounds = true;
    }
}

extension UIView {
    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
}
