//
//  MainMenuViewController.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 4/24/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//
// Under Git Version Control
// Using Dcloftus's GitHub

import UIKit

class MainMenuViewController: UIViewController {
    
    var OnePlayerVC: OnePlayerViewController?
    
    @IBOutlet weak var LastHighest: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /*
    override func viewDidAppear(_ animated: Bool) {
    
    LastHighest.text = String(describing: (OnePlayerVC?.game.scores[13])!)
        
    }
 */

}

