//
//  ConfigViewController.swift
//  A Hint of Yahtzee
//
//  Created by Daniel Loftus on 4/25/19.
//  Copyright © 2019 Daniel Loftus. All rights reserved.
//

import UIKit

class OnePlayerScoreViewController: UIViewController {
    
    
    
    @IBOutlet weak var AcesLabel: UILabel!
    @IBOutlet weak var TwosLabel: UILabel!
    @IBOutlet weak var ThreesLabel: UILabel!
    @IBOutlet weak var FoursLabel: UILabel!
    @IBOutlet weak var FivesLabel: UILabel!
    @IBOutlet weak var SixesLabel: UILabel!
    @IBOutlet weak var ThreeOKLabel: UILabel!
    @IBOutlet weak var FourOKLabel: UILabel!
    @IBOutlet weak var FullHouseLabel: UILabel!
    @IBOutlet weak var SMStraightLabel: UILabel!
    @IBOutlet weak var LGStraightLabel: UILabel!
    @IBOutlet weak var YahtzeeLabel: UILabel!
    @IBOutlet weak var ChanceLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    
    var OnePlayerVC: OnePlayerViewController?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //print(OnePlayerVC?.game.scores)
        
        YahtzeeLabel.text = String(describing: (OnePlayerVC?.game.scores[0])!)
        LGStraightLabel.text = String(describing: (OnePlayerVC?.game.scores[1])!)
        SMStraightLabel.text = String(describing: (OnePlayerVC?.game.scores[2])!)
        FullHouseLabel.text = String(describing: (OnePlayerVC?.game.scores[3])!)
        FourOKLabel.text = String(describing: (OnePlayerVC?.game.scores[4])!)
        ThreeOKLabel.text = String(describing: (OnePlayerVC?.game.scores[5])!)
        SixesLabel.text = String(describing: (OnePlayerVC?.game.scores[6])!)
        FivesLabel.text = String(describing: (OnePlayerVC?.game.scores[7])!)
        FoursLabel.text = String(describing: (OnePlayerVC?.game.scores[8])!)
        ThreesLabel.text = String(describing: (OnePlayerVC?.game.scores[9])!)
        TwosLabel.text = String(describing: (OnePlayerVC?.game.scores[10])!)
        AcesLabel.text = String(describing: (OnePlayerVC?.game.scores[11])!)
        ChanceLabel.text = String(describing: (OnePlayerVC?.game.scores[12])!)
        TotalLabel.text = String(describing: (OnePlayerVC?.game.scores[13])!)
    }
    
    
    @IBAction func Menu(_ sender: Any) {
    }
    

    

}
