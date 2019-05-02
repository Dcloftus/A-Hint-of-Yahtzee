//
//  ConfigViewController.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 4/25/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    
    
    var OnePlayerVC: OnePlayerViewController?
    
    
    
    @IBOutlet weak var AcesLabel: UILabel!
    @IBOutlet weak var TwosLabel: UILabel!
    @IBOutlet weak var ThreesLabel: UILabel!
    @IBOutlet weak var FoursLabel: UILabel!
    @IBOutlet weak var FivesLabel: UILabel!
    @IBOutlet weak var SixesLabel: UILabel!
    @IBOutlet weak var ThreeOKLabel: UILabel!
    @IBOutlet weak var FourOKLabel: UILabel!
    @IBOutlet weak var FullHouseLabel: UILabel!
    @IBOutlet weak var SMStrightLabel: UILabel!
    @IBOutlet weak var LGStrightLabel: UILabel!
    @IBOutlet weak var YahtzeeLabel: UILabel!
    @IBOutlet weak var ChanceLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Menu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

}
