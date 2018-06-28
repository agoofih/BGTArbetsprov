//
//  WebKitViewController.swift
//  BGTArbetsprov
//
//  Created by Daniel T. Barwén on 2018-06-28.
//  Copyright © 2018 Daniel T. Barwén. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: "https://google.se")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
