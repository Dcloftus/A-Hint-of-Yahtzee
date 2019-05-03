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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        /*
        TotalLabel.text = String(describing: (OnePlayerVC?.scores[13])!)
        ChanceLabel.text = String(describing: (OnePlayerVC?.scores[12])!)
        AcesLabel.text = String(describing: (OnePlayerVC?.scores[11])!)
        TwosLabel.text = String(describing: (OnePlayerVC?.scores[10])!)
        ThreesLabel.text = String(describing: (OnePlayerVC?.scores[9])!)
        FoursLabel.text = String(describing: (OnePlayerVC?.scores[8])!)
        FivesLabel.text = String(describing: (OnePlayerVC?.scores[7])!)
        SixesLabel.text = String(describing: (OnePlayerVC?.scores[6])!)
        ThreeOKLabel.text = String(describing: (OnePlayerVC?.scores[5])!)
        FourOKLabel.text = String(describing: (OnePlayerVC?.scores[4])!)
        FullHouseLabel.text = String(describing: (OnePlayerVC?.scores[3])!)
        SMStrightLabel.text = String(describing: (OnePlayerVC?.scores[2])!)
        LGStrightLabel.text = String(describing: (OnePlayerVC?.scores[1])!)
        YahtzeeLabel.text = String(describing: (OnePlayerVC?.scores[0])!)
        */
    }
    
    @IBAction func Menu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    

}
