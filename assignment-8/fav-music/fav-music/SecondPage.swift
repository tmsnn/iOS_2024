//
//  secondPage.swift
//  fav-music
//
//  Created by Aruzhan Kaharmanova on 08.11.2024.
//

import UIKit

class SecondPage: UIViewController {

    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
//    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var inputModel: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = inputModel?.title
//        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.poster
    }

    func configure(with model: Music?) {
        self.inputModel = model
    }
}
