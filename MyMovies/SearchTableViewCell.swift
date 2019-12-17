//
//  SearchTableViewCell.swift
//  MyMovies
//
//  Created by Christy Hicks on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    // MARK: Properties
    var hasBeenAdded: Bool = false
    var movieController: MovieController?
    var movie: MovieRepresentation? {
        didSet {
            setViews()
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addMovieButton: UIButton!
    
    // MARK: Methods
    // View
    override func awakeFromNib() {
        setViews()
    }

    private func setViews() {
        titleLabel.text = movie?.title
        
        if hasBeenAdded == false {
             addMovieButton.setTitle("Add Movie", for: .normal)
        } else if hasBeenAdded == true {
            addMovieButton.setTitle("Movie Added", for: .normal)
        }
    }
    
    // MARK: - Actions
    @IBAction func addMovieButtonTapped(_ sender: UIButton) {
        hasBeenAdded = !hasBeenAdded
        guard let title = titleLabel.text else {return}
        movieController?.createMovie(with: title)
        CoreDataStack.shared.save()

    }
}
