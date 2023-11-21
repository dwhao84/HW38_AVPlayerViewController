//
//  WebViewController.swift
//  HW38_MovieList
//
//  Created by Dawei Hao on 2023/11/17.
//

import UIKit
import WebKit

class WebViewController: UIViewController  {

    var webView: WKWebView!

    let segmentedControl = UISegmentedControl(items: [
        // backBtn
        UIImage(systemName: "arrow.up")!,
        // forwardBtn
        UIImage(systemName: "arrow.down")!
    ])

    // Passing Data from MovieListVC.
    var url: String?
    var navigationTitle: String?

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        showWebsite()
        print(url!)
        self.navigationItem.hidesBackButton = false
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = navigationTitle

        configureSegmentItem ()
    }

    func showWebsite() {
        let myURL = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    //MARK: - Configure forwardBarButton
    func configureSegmentItem () {

        segmentedControl.tintColor = .darkGray
        segmentedControl.isEnabled = true
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(selectSegmentControl), for: .valueChanged)

        let segmentItem: UIBarButtonItem = UIBarButtonItem(customView: segmentedControl)
        self.navigationItem.rightBarButtonItem = segmentItem
    }

    @objc func selectSegmentControl (_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {

            // backBtn
            case 0:
                print("Case 0")
                if webView.canGoBack {
                    webView.goBack()
                    print("webView go back")
                }

            // forwardBtn
            case 1:
                print("Case 1")
                if webView.canGoForward {
                    webView.goForward()
                    print("webView go forward")
                }
            default:
                break
        }

    }

}

extension WebViewController: UIWebViewDelegate, WKUIDelegate, WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if segmentedControl.isEnabled == webView.canGoBack {
            segmentedControl.isEnabled = webView.canGoForward
        }
        print("webView didFinish")
    }

}
