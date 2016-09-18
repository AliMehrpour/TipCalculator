//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Ali Mehrpour on 9/15/16.
//  Copyright © 2016 Ali Mehrpour. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipPercent = defaults.integerForKey(defaultTipPercentIndex)
        tipControl.selectedSegmentIndex = defaultTipPercent
    }

    @IBAction func changeTipPercent(sender: AnyObject) {
        let selectedIndex = tipControl.selectedSegmentIndex
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(selectedIndex, forKey: defaultTipPercentIndex)
        defaults.synchronize()
    }
}
