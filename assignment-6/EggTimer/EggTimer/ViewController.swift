import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer: Timer?
    var audio: AVAudioPlayer?
    
    let eggTimes: [String: Float]  = ["Soft": 3.0, "Medium": 5.0, "Hard": 7.0]

       
    override func viewDidLoad() {
        super.viewDidLoad()
        resetValues()
    }

    @IBOutlet weak var TopLabel: UILabel!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    @IBAction func eggSelected(_ sender: UIButton) {
        guard let title = sender.titleLabel!.text, let totalTime = eggTimes[title] else {
            print ("can not find button title")
            return
        }
        
        resetValues()
        
        var timeCounter: Float = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            timeCounter += 1
            self.ProgressBar.progress = timeCounter / totalTime
            if timeCounter == totalTime {
                timer.invalidate()
                self.TopLabel.text = "Done!"
                self.playSound()
            }
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "wav") else {
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
    
    func resetValues(){
        timer?.invalidate()
        self.TopLabel.text = "Your Egg Type"
        self.ProgressBar.progress = 0
    }
}
