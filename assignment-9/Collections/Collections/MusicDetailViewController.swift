//
//  MusicDetailViewController.swift
//  Collections
//
//  Created by Tomiris on 14.11.2024.
//

import UIKit

class MusicDetailViewController: UIViewController {

    private var music: Music?
    
    @IBOutlet weak var musicDescription: UILabel!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTitle.text = music?.title
        musicDescription.text = music?.description
        image.image = music?.image
    }
    
    func configure(with model: Music) {
        self.music = model
    }

}
