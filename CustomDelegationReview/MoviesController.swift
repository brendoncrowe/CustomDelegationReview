//
//  ViewController.swift
//  CustomDelegationReview
//
//  Created by Brendon Crowe on 2/13/23.
//

import UIKit

class MoviesController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var fontSize: CGFloat = 17 {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
        tableView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsController? else {
            fatalError("could not load settings view controller")
        }
        settingsVC?.delegate = self
    }
    
    private func loadMovies() {
        movies = Movie.allMovies
    }
}

extension MoviesController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = movies[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.textProperties.font = UIFont(name: "Avenir Next", size: fontSize)!
        content.text = movie.name
        content.secondaryTextProperties.font = UIFont(name: "Avenir Next", size: fontSize)!
        content.secondaryText = String(movie.year)
        cell.contentConfiguration = content
        return cell
    }
    
}

extension MoviesController: SettingsControllerDelegate {
    func changeFontSize(to size: Int) {
        self.fontSize = CGFloat(size)
    }
}
