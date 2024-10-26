//
//  ViewController.swift
//  fav-music
//
//  Created by Aruzhan Kaharmanova on 26.10.2024.
//

import UIKit

struct Music {
    let title: String
    let author: String
    let genre: String
    let poster: UIImage
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        let music = popularMusic[indexPath.row]
        cell.poster.image = music.poster
        cell.title.text = music.title
        cell.author.text = music.author
        cell.genre.text = music.genre
        
        return cell
    }
    

    
    @IBOutlet weak var musicTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any adbookditional setup after loading the view.
        musicTable.dataSource = self
        musicTable.delegate = self
        
    }
    
    
    
    let popularMusic: [Music] = [
        Music(title: "Just the Way You Are", author: "Bruno Mars", genre: "Pop", poster: #imageLiteral(resourceName: "m1")),
        Music(title: "Uptown Funk", author: "Mark Ronson ft. Bruno Mars", genre: "Funk", poster: #imageLiteral(resourceName: "m2")),
        Music(title: "Die with a Smile", author: "Spit Syndicate", genre: "Hip-Hop", poster: #imageLiteral(resourceName: "m3")),
        Music(title: "Dancin", author: "Aaron Smith", genre: "Electronic", poster: #imageLiteral(resourceName: "m4")),
        Music(title: "Blinding Lights", author: "The Weeknd", genre: "Synth-Pop", poster: #imageLiteral(resourceName: "m5")),
        Music(title: "Levitating", author: "Dua Lipa", genre: "Pop", poster: #imageLiteral(resourceName: "m6")),
        Music(title: "Good 4 U", author: "Olivia Rodrigo", genre: "Pop Rock", poster: #imageLiteral(resourceName: "m7")),
        Music(title: "As It Was", author: "Harry Styles", genre: "Pop", poster: #imageLiteral(resourceName: "m8")),
        Music(title: "Snooze", author: "SZA", genre: "R&B", poster: #imageLiteral(resourceName: "m9")),
        Music(title: "Shake It Off", author: "Taylor Swift", genre: "Pop", poster: #imageLiteral(resourceName: "m10"))
    ]
}
