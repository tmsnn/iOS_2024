
//
//  ViewController.swift
//  randomizer
//
//  Created by Tomiris on 21.11.2024.
//

import UIKit
import Alamofire
import Kingfisher

struct Hero: Decodable {
    let name: String
    let biography: Biography
    let appearance: Appearance
    let images: HeroImage
    let work: Work
    let connections: Connections

    struct Biography: Decodable {
        let fullName: String
        let alignment: String
        let firstAppearance: String
    }

    struct Appearance: Decodable {
        let gender: String
        let eyeColor: String
        let weight: [String]
    }

    struct HeroImage: Decodable {
        let sm: String
    }

    struct Work: Decodable {
        let occupation: String
    }

    struct Connections: Decodable {
        let relatives: String
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var HeroImage: UIImageView!
    @IBOutlet weak var HeroName: UILabel!
    @IBOutlet weak var HeroDescription: UILabel!
    @IBOutlet weak var HeroGender: UILabel!
    @IBOutlet weak var HeroWeight: UILabel!
    @IBOutlet weak var HeroEyeColor: UILabel!
    @IBOutlet weak var HeroAlignment: UILabel!
    @IBOutlet weak var HeroFirstAppearance: UILabel!
    @IBOutlet weak var HeroOccupation: UILabel!
    @IBOutlet weak var HeroRelatives: UILabel!

    @IBAction func RollHero(_ sender: Any) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }

    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"

        // Using Alamofire to make a request
        AF.request(urlString).responseDecodable(of: Hero.self) { response in
            switch response.result {
            case .success(let hero):
                self.updateUI(with: hero)
            case .failure(let error):
                self.showError(message: error.localizedDescription)
            }
        }
    }

    private func updateUI(with hero: Hero) {
        DispatchQueue.main.async {
            self.HeroName.text = hero.name
            self.HeroDescription.text = hero.biography.fullName
            self.HeroGender.text = hero.appearance.gender
            self.HeroWeight.text = "\(hero.appearance.weight)"
            self.HeroEyeColor.text = hero.appearance.eyeColor
            self.HeroAlignment.text = hero.biography.alignment
            self.HeroFirstAppearance.text = hero.biography.firstAppearance
            self.HeroOccupation.text = hero.work.occupation
            self.HeroRelatives.text = hero.connections.relatives

            // Using Kingfisher to load the hero's image
            if let imageUrl = URL(string: hero.images.sm) {
                self.HeroImage.kf.setImage(with: imageUrl)
            } else {
                self.HeroImage.image = nil
            }
        }
    }

    private func showError(message: String) {
        DispatchQueue.main.async {
            self.HeroName.text = message + "\nReRoll again!"
            self.HeroDescription.text = ""
            self.HeroImage.image = nil
        }
    }
}
