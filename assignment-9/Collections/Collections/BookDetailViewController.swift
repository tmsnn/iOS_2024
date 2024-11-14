//
//  BookDetailViewController.swift
//  Collections
//
//  Created by Tomiris on 14.11.2024.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    private var book: Book?
    
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTitle.text = book?.title
        bookDescription.text = book?.description
        image.image = book?.image
    }
    
    func configure(with model: Book) {
        self.book = model
    }
  

}
