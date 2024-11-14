//
//  MovieViewController.swift
//  Collections
//
//  Created by Tomiris on 14.11.2024.
//

import UIKit

struct Movie {
    let image: UIImage
    let title: String
    let author: String
    let genre: String
    
    let description: String
}

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var selectedMovie: Movie?
    
    private var movies: [Movie] = [
        Movie(image: #imageLiteral(resourceName: "Inception"), title: "Inception", author: "Christopher Nolan", genre: "Sci-Fi", description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO."),
           Movie(image: #imageLiteral(resourceName: "The Dark Knight"), title: "The Dark Knight", author: "Christopher Nolan", genre: "Action", description: "When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham."),
           Movie(image: #imageLiteral(resourceName: "The Matrix"), title: "The Matrix", author: "The Wachowskis", genre: "Sci-Fi", description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers."),
           Movie(image: #imageLiteral(resourceName: "Titanic"), title: "Titanic", author: "James Cameron", genre: "Romance", description: "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic."),
           Movie(image: #imageLiteral(resourceName: "The Godfather"), title: "The Shawshank Redemption", author: "Frank Darabont", genre: "Drama", description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency."),
           Movie(image: #imageLiteral(resourceName: "The Godfather"), title: "The Godfather", author: "Francis Ford Coppola", genre: "Crime", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."),
           Movie(image: #imageLiteral(resourceName: "Forrest Gump"), title: "Forrest Gump", author: "Robert Zemeckis", genre: "Drama", description: "The presidencies of Kennedy and Johnson, the events of Vietnam, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an incredible story to tell."),
           Movie(image: #imageLiteral(resourceName: "Gladiator"), title: "Gladiator", author: "Ridley Scott", genre: "Action", description: "A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery."),
           Movie(image: #imageLiteral(resourceName: "Pulp Fiction"), title: "Pulp Fiction", author: "Quentin Tarantino", genre: "Crime", description: "The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption."),
           Movie(image: #imageLiteral(resourceName: "Avatar"), title: "Avatar", author: "James Cameron", genre: "Sci-Fi", description: "A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.")

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBOutlet weak var tableView: UITableView!

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CellTableViewCell
        let movie = movies[indexPath.row]
        cell.Author.text = movie.author
        cell.Poster.image = movie.image
        cell.Title.text = movie.title
        cell.Genre.text = movie.genre
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? MovieDetailViewController
        if let selectedMovie = selectedMovie {
            destVC?.configure(with: selectedMovie)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "goToMovie", sender: self)
    }

}
