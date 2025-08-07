//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Joel Martin Chuco Marrufo on 28/07/25.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie?.title
        genreLabel.text = movie?.genre
        yearLabel.text = movie?.year
        //posterImageView.image = UIImage(named: movie?.imageName ?? "")
        if let url = URL(string: movie?.imageName ?? "") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data,
                      let image = UIImage(data: data),
                      error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.posterImageView.image = image
                }
            }.resume()
        }
    }
}
