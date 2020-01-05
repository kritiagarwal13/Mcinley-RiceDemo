//
//  WebViewController.swift
//  Mckinley&RiceDemo
//
//  Created by Kriti Agarwal on 05/01/20.
//  Copyright © 2020 Kriti Agarwal. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    //MARK:- @IBOutlets
    @IBOutlet weak var webView: WKWebView!
    
    //MARK:- Variables
    var urlStr: String?
    
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print(urlStr!)
        let myURL = URL(string: "\(webViewUrl)\(urlStr ?? "")")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
}
