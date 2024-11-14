//
//  MovieDetailViewController.swift
//  Collections
//
//  Created by Tomiris on 14.11.2024.
//

import UIKit

class MovieDetailViewController: UIViewController {

    private var movie: Movie?
    
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie?.title
        movieDescription.text = movie?.description
        image.image = movie?.image
    }
    
    func configure(with model: Movie) {
        self.movie = model
    }

}
