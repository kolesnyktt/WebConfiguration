//
//  WebViewController.swift
//  WebConfiguration
//
//  Created by Taras Kolesnyk on 09.12.2021.
//

import UIKit
import WebKit
// http://apps.vortexads.io/guest?app=4567&uuid=123

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    
    var url: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        if (url != nil)
        {
            loadView(url: url)
        }
    }
    
    func loadView(url: String) {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webView
        webView.load(URLRequest(url: URL(string: url)!))
    }

}
