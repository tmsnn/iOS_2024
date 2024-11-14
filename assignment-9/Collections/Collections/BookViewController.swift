//
//  BookViewController.swift
//  Collections
//
//  Created by Tomiris on 14.11.2024.
//

import UIKit

struct Book {
    let image: UIImage
    let title: String
    let author: String
    let genre: String
    
    let description: String
}

class BookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedBook: Book?
    
    private var books: [Book] = [
        Book(image: #imageLiteral(resourceName: "1984"), title: "1984", author: "George Orwell", genre: "Dystopian", description: "A totalitarian regime controls every aspect of life in a world of constant surveillance and propaganda."),
        Book(image: #imageLiteral(resourceName: "To Kill a Mockingbird"), title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", description: "A young girl navigates her coming-of-age years in the South, while witnessing racial injustice and human compassion."),
        Book(image: #imageLiteral(resourceName: "Pride and Prejudice"), title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", description: "A classic tale of love, misunderstandings, and societal expectations, as Elizabeth Bennet meets the wealthy and reserved Mr. Darcy."),
        Book(image: #imageLiteral(resourceName: "The Great Gatsby.jpg"), title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Tragedy", description: "The tragic story of Jay Gatsby's obsession with Daisy Buchanan, set against the backdrop of the Roaring Twenties."),
        Book(image: #imageLiteral(resourceName: "Moby-Dick"), title: "Moby-Dick", author: "Herman Melville", genre: "Adventure", description: "The epic tale of Captain Ahab's obsessive quest to kill the elusive white whale, Moby Dick."),
        Book(image: #imageLiteral(resourceName: "The Catcher in the Rye"), title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Fiction", description: "A young man's journey through adolescence and his struggles with identity and society in a post-World War II world."),
        Book(image: #imageLiteral(resourceName: "The Lord of the Rings.jpg"), title: "The Lord of the Rings", author: "J.R.R. Tolkien", genre: "Fantasy", description: "An epic high-fantasy adventure where a young hobbit embarks on a perilous journey to destroy a powerful artifact."),
        Book(image: #imageLiteral(resourceName: "Harry Potter and the Sorcerer's Stone"), title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", genre: "Fantasy", description: "A young boy discovers he is a wizard and enters a magical world of wonder, danger, and friendship."),
        Book(image: #imageLiteral(resourceName: "The Alchemist"), title: "The Alchemist", author: "Paulo Coelho", genre: "Fiction", description: "A young shepherd embarks on a journey to find his personal legend and fulfill his dreams."),
        Book(image: #imageLiteral(resourceName: "The Lord of the Rings"), title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", description: "The prequel to The Lord of the Rings, telling the story of Bilbo Baggins and his unexpected adventure with dwarves and dragons.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBOutlet weak var tableView: UITableView!

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CellTableViewCell
        let book = books[indexPath.row]
        cell.Author.text = book.author
        cell.Poster.image = book.image
        cell.Title.text = book.title
        cell.Genre.text = book.genre
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? BookDetailViewController
        if let selectedBook = selectedBook {
            destVC?.configure(with: selectedBook)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = books[indexPath.row]
        performSegue(withIdentifier: "goToBook", sender: self)
    }

}
