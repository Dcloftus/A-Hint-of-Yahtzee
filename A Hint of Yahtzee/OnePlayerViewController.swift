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

    @IBOutlet weak var Roll: UIButton!
    
    
    
    @IBOutlet weak var TopLeftSwitch: UISwitch!
    
    @IBOutlet weak var TopRightSwitch: UISwitch!
    
    @IBOutlet weak var BottomLeftSwitch: UISwitch!
    
    @IBOutlet weak var BottomCenterSwitch: UISwitch!
    
    @IBOutlet weak var BottomRightSwitch: UISwitch!
    
    //***********************************************************************************//
    
    
    
//************************************ Variables ************************************//
    
    var firstNum = 0
    var secondNum = 0
    var thirdNum = 0
    var fourthNum = 0
    var fifthNum = 0
    
    var rolls = 0
//***********************************************************************************//
    
    
    
//************************************ Functions ************************************//
    
    @IBAction func Roll(_ sender: Any) {
        //Increments a number of rolls counter
        rolls += 1
        
        //print(rolls)
        
        //This mess of if statements will let you select dice you want to keep from re rolling
        if !TopLeftSwitch.isOn {
            let firstNum = arc4random_uniform(5) + 1
            topLeft.image = UIImage(named: "Dice\(firstNum)")
        }
        
        if !TopRightSwitch.isOn {
            let secondNum = arc4random_uniform(5) + 1
            topRight.image = UIImage(named: "Dice\(secondNum)")
        }
        
        if !BottomLeftSwitch.isOn {
            let thirdNum = arc4random_uniform(5) + 1
            bottomLeft.image = UIImage(named: "Dice\(thirdNum)")
        }
        
        if !BottomCenterSwitch.isOn {
            let fourthNum = arc4random_uniform(5) + 1
            bottomCenter.image = UIImage(named: "Dice\(fourthNum)")
        }
        
        if !BottomRightSwitch.isOn {
            let fifthNum = arc4random_uniform(5) + 1
            bottomRight.image = UIImage(named: "Dice\(fifthNum)")
        }
        
        
        //this will limit the number of rolls to 3
        if (rolls == 3) {
            Roll.isEnabled = false
        }
        
    }
   

    
    
//***********************************************************************************//

}
