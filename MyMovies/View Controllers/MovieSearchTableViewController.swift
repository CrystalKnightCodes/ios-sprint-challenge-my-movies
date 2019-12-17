//
//  MovieSearchTableViewController.swift
//  MyMovies
//
//  Created by Spencer Curtis on 8/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController, UISearchBarDelegate {
    // MARK: - Outlets
     @IBOutlet weak var searchBar: UISearchBar!
    
    
    // MARK: - Properties
    var movieController = MovieController()
    
    
    // MARK: - Methods
    // View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    // Buttons
    @objc func addMovieButtonTapped() {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        movieController.searchForMovie(with: searchTerm) { (error) in
            
            guard error == nil else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // Data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController.searchedMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell()}
        
        cell.movie = movieController.searchedMovies[indexPath.row]
 
        cell.movieController = movieController
        
        return cell
    }
}
