//
//  ViewController.swift
//  app-ci-cd-github-actions-demo
//
//  Created by harry.li on 2025/6/18.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView.load(URLRequest(url: URL(string: "https://zhgchg.li")!))
    }


}

