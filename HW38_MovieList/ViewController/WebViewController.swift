//
//  WebViewController.swift
//  HW38_MovieList
//
//  Created by Dawei Hao on 2023/11/17.
//

import UIKit
import WebKit

class WebViewController: UIViewController, UIWebViewDelegate, WKUIDelegate, WKNavigationDelegate {

    var webView: WKWebView!
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

    }



    func showWebsite () {
        let myURL = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        //  webView.loadHTMLString(url!, baseURL: nil)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }
}

