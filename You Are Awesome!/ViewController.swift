//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Drew Cappel on 1/4/19.
//  Copyright © 2019 Drew Cappel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
   
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var awesomeImageView: UIImageView!
    
    var index = 0
    var imageIndex = -1
    let numberOfImages = 6
    var awesomePlayer = AVAudioPlayer()
    let numberOfSounds = 5
    var soundIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar needs help, they call you",
                        "You brighten my day!",
                        "You are da bomb!",
                        "Hey, fabulous!",
                        "You are tremendous!",
                        "You've got the design skills of Jony Ive!",
                        "I can't wait to download your app!"]
        
        var newIndex: Int   // declares but doesn't intialize
        
        // showing messages
        repeat {
            newIndex = Int.random(in:0..<messages.count)
        } while index == newIndex
        
        index = newIndex
        messageLabel.text = messages[index]
        
        // showing images
        repeat {
            newIndex = Int.random(in:0..<numberOfImages)
        } while imageIndex == newIndex
        
        imageIndex = newIndex
        awesomeImageView.image = UIImage(named: "IMG_\(imageIndex)")
        
        // get a random number for sounds
        repeat {
            newIndex = Int.random(in:0..<numberOfSounds)
        } while soundIndex == newIndex
        
        soundIndex = newIndex
        
        // playing sounds
        var soundName = "sound\(soundIndex)"
        // attempt to load in sound name
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
                } catch {
                    print("Error: \(soundName) not found.")
                }
        } else {
            // if load-in did not work
            print("Error: \(soundName) not found.")
        }
    }
}

