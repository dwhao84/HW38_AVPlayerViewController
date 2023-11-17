//
//  MovieListViewController.swift
//  HW38_AVPlayerViewController
//
//  Created by Dawei Hao on 2023/11/15.
//

import UIKit
import SafariServices

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var urlAddress: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Login to MovieListVC")

        setupDelegate()

        print(movieList.count)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupDelegate () {

        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = 100

        self.tableView.isEditing = false

        // Register the tableView cell to xib cell.
        tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {

    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell

        cell.titleLabel.text = movieList[indexPath.row].movieName
        cell.detailLabel.text = movieList[indexPath.row].movieTitle
        cell.movieImageView.image = UIImage(named: movieList[indexPath.row].movieTitle)

        return cell
    }

    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        urlAddress = movieList[indexPath.row].url

        let webVC = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webVC?.url = urlAddress

        navigationController?.pushViewController(webVC!, animated: true)
        print(urlAddress)
        print(indexPath)
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
