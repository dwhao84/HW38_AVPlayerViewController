//
//  MovieListViewController.swift
//  HW38_AVPlayerViewController
//
//  Created by Dawei Hao on 2023/11/15.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("MovieListVC")
        setupDelegate()
    }

    func setupDelegate () {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = 200

        self.tableView.isEditing = false
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {

    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)

        var content = cell.defaultContentConfiguration()

        content.text = movieList[indexPath.row].movieName
        content.secondaryText = movieList[indexPath.row].movieTitle

        content.textProperties.color = .darkGray
        content.secondaryTextProperties.color = .lightGray

        content.image = UIImage(named: movieList[indexPath.row].movieTitle)
        content.imageProperties.cornerRadius = 5
        content.imageProperties.maximumSize = CGSize(width: 150, height: 150)

        cell.contentConfiguration = content

        return cell
    }

    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    // editingStyleForRowAt
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        print("editingStyleForRowAt")
        return .none
    }

    // shouldIndentWhileEditingRowAt
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        print("shouldIndentWhileEditingRowAt")
        return true
    }



}
