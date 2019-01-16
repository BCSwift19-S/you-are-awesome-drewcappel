//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Drew Cappel on 1/4/19.
//  Copyright © 2019 Drew Cappel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    // Code below executes when the app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {
        messageLabel.text = "You Are Awesome!"
    }
}

