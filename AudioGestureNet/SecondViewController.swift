//
//  SecondViewController.swift
//  AudioGestureNet
//
//  Created by Alan Lam on 5/18/19.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController, AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        myButton.setTitle("Play Audio", for: .normal)
    }
    
    @IBOutlet weak var myButton: UIButton!
    
    var myTimer: Timer?
    
    @IBAction func doAudioButton(_ sender: Any) {
        if (myAudioPlayer?.isPlaying)! {
            myAudioPlayer?.pause()
            myButton.setTitle("Play Audio", for: .normal)
            myTimer?.invalidate()
        }
        else {
            myAudioPlayer?.play()
            myButton.setTitle("Pause Audio", for: .normal)
            myTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
                self.updateDisplay()
            })
        }
    }
    
    @IBOutlet weak var myCurrentPosition: UILabel!
    
    @IBOutlet weak var myDuration: UILabel!
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    var myAudioPlayer: AVAudioPlayer?
    
    func updateDisplay() {
        if let current = myAudioPlayer?.currentTime {
            myCurrentPosition.text = "Current Position: \(current)"
            if let duration = myAudioPlayer?.duration {
                myProgressView.progress = Float(current / duration)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Find the path to the audio file */
        /* Create an Audio Player with that file */
        if let fileURL = Bundle.main.url(forResource: "t", withExtension: "mp3") {
            do {
                try myAudioPlayer = AVAudioPlayer(contentsOf: fileURL)
                myAudioPlayer?.delegate = self
                if let duration = myAudioPlayer?.duration {
                    myDuration.text = "Total Duration: \(duration)"
                    updateDisplay()
                }
            }
            catch {
                let vc = UIAlertController(title: "Error", message: "AVAudioPlayer failed", preferredStyle: .alert)
                vc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(vc, animated: true, completion: nil)
            }
        }
        else {
            let vc = UIAlertController(title: "Error", message: "Could not find audio file", preferredStyle: .alert)
            vc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(vc, animated: true, completion: nil)
        }
    }


}

