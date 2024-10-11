//
//  ViewController.swift
//  Dice
//
//  Created by Tomiris Nyshanbek on 10.10.2024.
//
import UIKit

class ViewController: UIViewController {

    // Outlets for the dice image views
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    // Action triggered when the button is pressed
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // Generate two random numbers for the dice
        let randomIndex1 = Int.random(in: 0...5)
        let randomIndex2 = Int.random(in: 0...5)
        
        // Update the image views with the random dice images
        diceImageView1.image = UIImage(named: diceImages[randomIndex1])
        diceImageView2.image = UIImage(named: diceImages[randomIndex2])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    
        diceImageView1.image = UIImage(named: "dice1")
        diceImageView2.image = UIImage(named: "dice2")
    }
}
