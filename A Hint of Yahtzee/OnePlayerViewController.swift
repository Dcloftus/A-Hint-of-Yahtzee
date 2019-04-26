//
//  OnePlayerViewController.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 4/25/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {
//********************************** MAIN FUNCTIONS **********************************//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Menu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//***********************************************************************************//
    
    
    
    
    
//************************************* Outlets *************************************//
    
    @IBOutlet weak var topLeft: UIImageView!
    
    @IBOutlet weak var topRight: UIImageView!
    
    @IBOutlet weak var bottomLeft: UIImageView!
    
    @IBOutlet weak var bottomCenter: UIImageView!
    
    @IBOutlet weak var bottomRight: UIImageView!
    
//***********************************************************************************//
    
    
    
//************************************ Functions ************************************//
    
    @IBAction func Roll(_ sender: Any) {
        let firstNum = arc4random_uniform(5) + 1
        let secondNum = arc4random_uniform(5) + 1
        let thirdNum = arc4random_uniform(5) + 1
        let fourthNum = arc4random_uniform(5) + 1
        let fifthNum = arc4random_uniform(5) + 1
        
        topLeft.image = UIImage(named: "Dice\(firstNum)")
        topRight.image = UIImage(named: "Dice\(secondNum)")
        bottomLeft.image = UIImage(named: "Dice\(thirdNum)")
        bottomCenter.image = UIImage(named: "Dice\(fourthNum)")
        bottomRight.image = UIImage(named: "Dice\(fifthNum)")
        
        
    }
    
//***********************************************************************************//

}
