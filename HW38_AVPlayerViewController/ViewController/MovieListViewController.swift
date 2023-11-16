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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("MovieListVC")
        setupDelegate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupDelegate () {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = 100

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        cell.textLabel?.text = movieList[indexPath.row].movieName
        cell.textLabel?.textColor = .darkGray
        cell.selectionStyle = .none

        return cell
    }

    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(movieList[indexPath.row].movieName)
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
