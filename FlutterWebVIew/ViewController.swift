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
        self.webView.addJavascriptInterface(JSInterface(webView: webView), forKey: "NativeFlutterInterface");
        
        
        let request = URLRequest(url: URL(string: "http://0.0.0.0:8081/build/web/")!, cachePolicy: .reloadIgnoringCacheData)
        self.webView.loadRequest(request)
        if let context = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") {
            (context as AnyObject).evaluateScript("var console = { log: function(message) { _consoleLog(message) } }")
            let consoleLog: @convention(block) (String) -> Void = { message in
                print("javascript_log: " + message)
            }
            (context as AnyObject).setObject(unsafeBitCast(consoleLog, to: AnyObject.self), forKeyedSubscript: "_consoleLog")
        }
        
    }
    
    deinit {
        self.webView.removeJavascriptInterfaces()
    }

}

