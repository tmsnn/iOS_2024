//
//  MusicCell.swift
//  fav-music
//
//  Created by Aruzhan Kaharmanova on 08.11.2024.
//


import UIKit

class MusicCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ model: Music) {
        title.text = model.title
        poster.image = model.poster
        author.text = model.author
        genre.text = model.genre
    }
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var author: UILabel!
}
