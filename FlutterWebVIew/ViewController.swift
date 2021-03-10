//
//  ViewController.swift
//  FlutterWebVIew
//
//  Created by Gangadharan on 10/03/21.
//

import UIKit
import WebKit
import JavaScriptCore

class ViewController: UIViewController{
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.addJavascriptInterface(JSInterface(), forKey: "NativeFlutterInterface");
        
        
        let request = URLRequest(url: URL(string: "http://0.0.0.0:8081/build/web/")!, cachePolicy: .reloadIgnoringCacheData)
        self.webView.loadRequest(request)
        
    }
    
    deinit {
        self.webView.removeJavascriptInterfaces()
    }

}

