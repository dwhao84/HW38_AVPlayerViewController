//
//  WebViewController.swift
//  HW38_MovieList
//
//  Created by Dawei Hao on 2023/11/17.
//

import UIKit
import WebKit

class WebViewController: UIViewController, UIWebViewDelegate, WKUIDelegate {

    var webView: WKWebView!

    var url: String?

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        showWebsite()

    }

    func showWebsite () {
        let myURL = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
