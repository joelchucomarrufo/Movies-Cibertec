//
//  MovieSelectionDelegate.swift
//  Movies
//
//  Created by Joel Martin Chuco Marrufo on 28/07/25.
//

import Foundation

protocol MovieSelectionDelegate: AnyObject {
    func didSelectMovie(_ movie: Movie)
}
