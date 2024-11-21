//
//  ViewController.swift
//  randomizer
//
//  Created by Tomiris on 21.11.2024.
//

import UIKit

struct Hero: Decodable {
    let name: String
    let biography: Biography
    let images: HeroImage
    

    struct Biography: Decodable {
        let fullName: String
    }

    struct HeroImage: Decodable {
        let sm: String
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
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.handleErrorIfNeeded(error: error) == false else {
                return
            }

            guard let data else { return }
            self.handleHeroData(data: data)
        }.resume()
    }

    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.sm)

            DispatchQueue.main.async {
                self.HeroName.text = hero.name
                self.HeroDescription.text = hero.biography.fullName
                self.HeroImage.image = heroImage
            }
        } catch {
            DispatchQueue.main.async {
                self.HeroName.text = error.localizedDescription + "\nReRoll again!"
                self.HeroDescription.text = ""
                self.HeroImage.image = nil
            }
        }
    }

    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
}

