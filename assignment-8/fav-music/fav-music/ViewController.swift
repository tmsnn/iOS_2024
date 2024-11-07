//
//  ViewController.swift
//  fav-music
//
//  Created by Aruzhan Kaharmanova on 08.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var songs: [Music] = [
        Music(title: "Just the Way You Are", author: "Bruno Mars", genre: "Pop", poster: #imageLiteral(resourceName: "m1"), description: "Bruno Mars' hit song 'Just the Way You Are' is an anthem of unconditional love and admiration. With its smooth melody and heartfelt lyrics, it expresses the beauty of being accepted for who you truly are. This romantic ballad showcases Mars’ signature style, combining pop with a soulful touch, and has become a favorite for weddings and romantic moments."),
        Music(title: "Uptown Funk", author: "Mark Ronson ft. Bruno Mars", genre: "Funk", poster: #imageLiteral(resourceName: "m2"), description: "A high-energy, funk-inspired track, 'Uptown Funk' by Mark Ronson and Bruno Mars is known for its infectious beat and catchy lyrics. The song's throwback style, complete with horns and a retro feel, makes it impossible to sit still. With a vibrant, upbeat vibe, 'Uptown Funk' became an instant hit, perfect for parties and dancing."),
        Music(title: "Die with a Smile", author: "Spit Syndicate", genre: "Hip-Hop", poster: #imageLiteral(resourceName: "m3"), description: "'Die with a Smile' by Spit Syndicate is an introspective and reflective hip-hop track that explores themes of personal growth, overcoming struggles, and the importance of living life authentically. With a smooth flow and thought-provoking lyrics, the song embodies resilience and positivity, even in the face of adversity."),
        Music(title: "Dancin", author: "Aaron Smith", genre: "Electronic", poster: #imageLiteral(resourceName: "m4"), description: "'Dancin’' by Aaron Smith is an electronic dance track with a groovy, upbeat tempo that encourages listeners to let loose and enjoy the moment. With its funky rhythm and infectious hook, this song has become a staple in dance clubs and parties, radiating a carefree, fun atmosphere."),
        Music(title: "Blinding Lights", author: "The Weeknd", genre: "Synth-Pop", poster: #imageLiteral(resourceName: "m5"), description: "Blending 80s synth-pop with modern R&B, 'Blinding Lights' by The Weeknd is a vibrant and nostalgic track that took the world by storm. The song is a mix of upbeat rhythms and haunting melodies, with lyrics that reflect longing and the desire to find solace. Its catchy chorus and retro vibes make it one of the biggest hits of recent years."),
        Music(title: "Levitating", author: "Dua Lipa", genre: "Pop", poster: #imageLiteral(resourceName: "m6"), description: "'Levitating' by Dua Lipa is a feel-good, upbeat pop song that exudes positivity and excitement. The track’s infectious beat and catchy chorus create a sense of joy and freedom, with lyrics about lifting someone up and making them feel invincible. It’s a perfect anthem for anyone looking to escape the mundane and feel on top of the world."),
        Music(title: "Good 4 U", author: "Olivia Rodrigo", genre: "Pop Rock", poster: #imageLiteral(resourceName: "m7"), description: "'Good 4 U' by Olivia Rodrigo is a powerful pop-rock anthem filled with raw emotion and fierce energy. The song addresses heartbreak and betrayal, but with an empowering twist. Rodrigo’s passionate vocals and the song's angsty instrumentation make it an explosive track that resonates with anyone who’s gone through the pain of a breakup."),
        Music(title: "As It Was", author: "Harry Styles", genre: "Pop", poster: #imageLiteral(resourceName: "m8"), description: "'As It Was' by Harry Styles is a reflective pop song that delves into themes of change and nostalgia. With a soft, melancholic vibe, the song captures a longing for the past while acknowledging that things can never stay the same. Its dreamy sound and introspective lyrics make it one of Styles’ most emotionally resonant tracks."),
        Music(title: "Snooze", author: "SZA", genre: "R&B", poster: #imageLiteral(resourceName: "m9"), description: "'Snooze' by SZA is a soulful R&B ballad that showcases vulnerability and longing in a relationship. With its smooth, jazzy instrumentation and intimate lyrics, the song speaks to the desire to hold on to love despite the challenges that may arise. SZA’s haunting vocals and emotional depth make this track a standout on her album."),
        Music(title: "Shake It Off", author: "Taylor Swift", genre: "Pop", poster: #imageLiteral(resourceName: "m10"), description: "'Shake It Off' by Taylor Swift is a playful pop anthem about letting go of negativity and embracing who you are. With its upbeat rhythm and carefree attitude, the song encourages listeners to brush off criticism and enjoy life to the fullest. Swift’s catchy chorus and energetic performance make it a perfect feel-good track for shaking off the stresses of the day.")
    ]


    @IBOutlet weak var musicTable: UITableView!
    private var selectedMusic: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTable.dataSource = self
        musicTable.delegate = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? SecondPage else {
            return
        }
        destVC.configure(with: selectedMusic)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMusic = songs[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        let currentModel = songs[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
