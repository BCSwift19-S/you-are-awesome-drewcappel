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
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        // playing sounds
        // attempt to load in sound name
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error: \(soundName) not found.")
            }
        } else {
            // if load-in did not work
            print("Error: \(soundName) not found.")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in:0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
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
        
        // showing messages
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        // showing images
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberOfImages)
        awesomeImageView.image = UIImage(named: "IMG_\(imageIndex)")
        
        // play a sound
        soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberOfSounds)
        let soundName = "sound\(soundIndex)"
        playSound(soundName: soundName, audioPlayer: &awesomePlayer)
    }
}

