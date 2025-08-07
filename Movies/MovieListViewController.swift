//
//  MovieListViewController.swift
//  Movies
//
//  Created by Joel Martin Chuco Marrufo on 28/07/25.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: MovieSelectionDelegate?
    
    let movies = [
        Movie(
            title: "Inception",
            genre: "Sci-Fi",
            year: "2010",
            imageName: "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/tXQvtRWfkUUnWJAn2tN3jERIUG.jpg"
        ),
        Movie(
            title: "Titanic",
            genre: "Drama",
            year: "1997",
            imageName: "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/VMOt5scbGmBKDvkfHjZN6Ki54i.jpg"
        ),
        Movie(
            title: "Interstellar",
            genre: "Sci-Fi",
            year: "2014",
            imageName: "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/cQuuBjG78j4b2r1dFpAjnjbUplv.jpg"
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        titleLabel.text = "Películas"
        
        tableView.delegate = self
        tableView.dataSource = self

        let nib = UINib(nibName: "MovieCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieCell")
        
    }
    
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }

        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        delegate?.didSelectMovie(selectedMovie)
    }
}

extension MovieListViewController: MovieSelectionDelegate {
    
    func didSelectMovie(_ movie: Movie) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
            detailVC.movie = movie
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
}
