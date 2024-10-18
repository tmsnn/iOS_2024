import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audio: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
      
        if let selectedSound = sender.titleLabel?.text {
            playingSound(chosenSound: selectedSound)
        } else {
            print("Button has no title")
        }
    }
    
    func playingSound(chosenSound: String) {
        guard let url = Bundle.main.url(forResource: chosenSound, withExtension: "wav") else {
                print("can not find sound")
                return
            }
            
        audio = try? AVAudioPlayer(contentsOf: url)
        guard let player = audio else {
            print("failed to initialize audio player")
            return
        }

        player.play()
    }
}
