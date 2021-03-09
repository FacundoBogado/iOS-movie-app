//
//  SearchMovieViewController.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 08/03/2021.
//

import UIKit

class SearchMovieViewController : UIViewController {
    
    private var movies: [MovieViewModel]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(with viewModel: [MovieViewModel]) {
        self.movies = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with: [Movie]) {
        
    }
}
