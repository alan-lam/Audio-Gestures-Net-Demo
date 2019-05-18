//
//  FirstViewController.swift
//  AudioGestureNet
//
//  Created by Alan Lam on 5/18/19.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            self.myLabel.text = "Tap or Swipe"
        }
    }
    
    @IBAction func doTapGesture(_ sender: Any) {
        myLabel.text = "Tap Gesture!"
        startTimer()
    }
    
    @IBAction func doSwipeRightGesture(_ sender: Any) {
        myLabel.text = "Swipe Right Gesture!"
        startTimer()
    }
    
    @IBAction func doSwipeLeftGesture(_ sender: Any) {
        myLabel.text = "Swipe Left Gesture!"
        startTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

