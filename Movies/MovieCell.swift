//
//  MovieCell.swift
//  Movies
//
//  Created by Joel Martin Chuco Marrufo on 28/07/25.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        if let url = URL(string: movie.imageName) {
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
