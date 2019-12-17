//
//  MyMoviesTableViewCell.swift
//  MyMovies
//
//  Created by Christy Hicks on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MyMoviesTableViewCell: UITableViewCell {
    // MARK: - Outlets
     @IBOutlet weak var hasWatchedButton: UIButton!
        @IBOutlet weak var titleLabel: UILabel!
        
    // MARK: Properties
        var movieController: MovieController?
        
        var movie: Movie? {
            didSet {
                setViews()
            }
        }
        
    // MARK: Methods
    // View
        private func setViews() {
            guard let movie = movie else {return}
            titleLabel.text = movie.title
            
            if movie.hasWatched == false {
                hasWatchedButton.setTitle("Unwatched", for: .normal)
            } else if movie.hasWatched == true {
                hasWatchedButton.setTitle("Watched", for: .normal)
                
            }
        }
        
    // MARK: - Action
        @IBAction func hasWatchedButtonTapped(_ sender: UIButton) {
            
            guard let movie = movie else {return}
            
            if movie.hasWatched == false {
                movieController?.updateMovie(movie: movie, hasWatched: true)
                hasWatchedButton.setTitle("Watched", for: .normal)
            } else if movie.hasWatched == true {
                movieController?.updateMovie(movie: movie, hasWatched: false)
                hasWatchedButton.setTitle("Unwatched", for: .normal)
            }
        }
    }

