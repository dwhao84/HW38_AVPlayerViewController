//
//  MovieListViewController.swift
//  HW38_AVPlayerViewController
//
//  Created by Dawei Hao on 2023/11/15.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var segmentedController: UISegmentedControl!

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

    // MARK: - Setup tableView
    // tableView
    func setupDelegate () {

        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = 100

        self.tableView.isEditing = false

        // Register the starWar cell to xib cell.
        tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)

        // Register the starTrek cell to xib cell.
        tableView.register(StarTrekTableViewCell.nib(), forCellReuseIdentifier: StarTrekTableViewCell.identifier)

        segmentedControl ()
    }

    // MARK: - SegmentedControl
    // Add the segmentedControl
    public func segmentedControl () {

        let items: [String] = ["Star Wars", "Star Trek"]
        segmentedController = UISegmentedControl(items: items)

        segmentedController.selectedSegmentIndex = 0
        print(segmentedController.selectedSegmentIndex)
        navigationItem.titleView = segmentedController

        segmentedController.addTarget(self, action: #selector(selectSegmentedControl), for: .touchUpInside)
    }

    // segmentControl Action
    @objc func selectSegmentedControl (_ sender : UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }

}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {

    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let starWarCell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell

        let starTrekCell = tableView.dequeueReusableCell(withIdentifier: StarTrekTableViewCell.identifier, for: indexPath) as! StarTrekTableViewCell

        switch (segmentedController.selectedSegmentIndex) {
                
            case 0:
                self.navigationItem.title = "Star War"
                starWarCell.titleLabel.text = movieList[indexPath.row].movieName
                starWarCell.detailLabel.text = movieList[indexPath.row].movieTitle
                starWarCell.movieImageView.image = UIImage(named: movieList[indexPath.row].movieTitle)
            case 1:
                self.navigationItem.title = "Star Trek"
                starTrekCell.titleLabel.text = starTrekMovieList[indexPath.row].movieName
                starTrekCell.detailTitleLabel.text = starTrekMovieList[indexPath.row].movieTitle
                starTrekCell.posterImageView.image = UIImage(named: starTrekMovieList[indexPath.row].movieTitle)

            return starTrekCell

            default: break

        }
        return starWarCell
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
