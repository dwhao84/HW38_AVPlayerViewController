//
//  MovieListViewController.swift
//  HW38_AVPlayerViewController
//
//  Created by Dawei Hao on 2023/11/15.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var activityIndicator: UIActivityIndicatorView!

    var segmentedController: UISegmentedControl!
    var urlAddress: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Login to MovieListVC")
        setupDelegate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - Setup tableView
    // tableView
    func setupDelegate () {

        self.navigationItem.title = "Star War"
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
     func segmentedControl () {

        let items: [String] = ["Star Wars", "Star Trek"]
        segmentedController = UISegmentedControl(items: items)

        segmentedController.selectedSegmentIndex = 0
        print(segmentedController.selectedSegmentIndex)
        navigationItem.titleView = segmentedController
        segmentedController.addTarget(self, action: #selector(segmentedControlValueChanged) , for: .valueChanged)
    }

    // segmentControl Action
    @objc func segmentedControlValueChanged (_ sender : UISegmentedControl) {
        tableView.reloadData()
        switch sender.selectedSegmentIndex {
            case 0:
                print("selectedSegment Index: \(sender.selectedSegmentIndex)")
            case 1:
                print("selectedSegment Index: \(sender.selectedSegmentIndex)")
            default:
                break
        }
    }

}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {

    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch segmentedController.selectedSegmentIndex {
            case 0:
                print("Case 0: numberOfRowsInSection is \(segmentedController.selectedSegmentIndex)")
                return movieList.count
            case 1:
                print("Case 1: numberOfRowsInSection is \(segmentedController.selectedSegmentIndex)")
                return starTrekMovieList.count
            default:
                print("numberOfRowsInSection is break")
                return movieList.count
        }
    }

    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let starWarCell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell

        let starTrekCell = tableView.dequeueReusableCell(withIdentifier: StarTrekTableViewCell.identifier, for: indexPath) as! StarTrekTableViewCell

        switch segmentedController.selectedSegmentIndex {
            case 0:
                self.navigationItem.title = "Star War"
                print("Star Wars is \(movieList.count)")
                starWarCell.titleLabel.text = movieList[indexPath.row].movieName
                starWarCell.detailLabel.text = movieList[indexPath.row].movieTitle
                starWarCell.movieImageView.image = UIImage(named: movieList[indexPath.row].movieTitle)
            case 1:
                self.navigationItem.title = "Star Trek"
                print("StarTrek is \(starTrekMovieList.count)")
                starTrekCell.starTrekTitleLabel.text = starTrekMovieList[indexPath.row].movieName
                starTrekCell.starTrekDetailTitleLabel.text = starTrekMovieList[indexPath.row].movieTitle
                starTrekCell.posterImageView.image = UIImage(named: starTrekMovieList[indexPath.row].movieTitle)

                return starTrekCell

            default:
                break
        }
        return starWarCell
    }

    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch segmentedController.selectedSegmentIndex {
            case 0:
                urlAddress = movieList[indexPath.row].url
            case 1:
                urlAddress = starTrekMovieList[indexPath.row].url
            default:
                break
        }

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

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        switch segmentedController.selectedSegmentIndex {
            case 0: break

            case 1: break

            default:
                break
        }
    }
}

