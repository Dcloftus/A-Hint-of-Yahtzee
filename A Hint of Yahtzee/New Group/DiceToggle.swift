//
//  DiceToggle.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 4/26/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//

import UIKit

class DiceToggle: UIButton {

    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        
    }
    
    func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        isOn = bool
        
        let image = UIImage(named: "Dice\(firstNum)Pressed") as UIImage?
        TestOutlet.setImage(image, for: UIControl.State.selected)
    }

}
