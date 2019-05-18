//
//  ThirdViewController.swift
//  AudioGestureNet
//
//  Created by Alan Lam on 5/18/19.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit
import WebKit

class ThirdViewController: UIViewController {

    var n = WKWebView()
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func doLoadURL(_ sender: Any) {
        let myURL = URL(string: myTextField.text!)
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }
    
    @IBOutlet weak var myWebView: WKWebView!
    
    let initialHTML = "<!DOCTYPE html>" +
                      "<html><head>" +
                      "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
                      "</head><body>" +
                      "<h1>Output goes here... </h1>" +
                      "</body></html>"
    
    var myTextView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myWebView.loadHTMLString(initialHTML, baseURL: nil)
        
        /*
        let rect = view.bounds.insetBy(dx: 40, dy: 40)
        let myView = UIView(frame: rect)
        myView.backgroundColor = UIColor.red
        view.addSubview(myView)
        
        let rect2 = view.bounds.insetBy(dx: 60, dy: 60)
        // let myTextView = UITextView(frame: rect2)
        myTextView = UITextView(frame: rect2)
        myTextView?.isEditable = false
        myTextView?.text = "Loading Web Content..."
        view.addSubview(myTextView!)
        */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let httpString = "https://apple.com"
        let httpURL = URL(string: httpString)
        let httpTask = URLSession.shared.dataTask(with: httpURL!) { (data, response, error) in
            let result = String(data: data!, encoding: String.Encoding.utf8)
            /* Sync up with the main GUI thread */
            DispatchQueue.main.async(execute: {
                self.myTextView?.text = result
            })
        }
        DispatchQueue.global(qos: .background).async {
            httpTask.resume()
        }
        /*
        do {
            let content = try String(contentsOf: httpURL!)
            myTextView?.text = content
        }
        catch {
            myTextView?.text = "Error loading URL"
        }
        */
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
