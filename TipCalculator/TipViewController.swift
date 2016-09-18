//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ali Mehrpour on 9/5/16.
//  Copyright © 2016 Ali Mehrpour. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var placeHolderLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Load default tip percent
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipPercent = defaults.integerForKey(defaultTipPercentIndex)
        tipControl.selectedSegmentIndex = defaultTipPercent
        
        // Make bill filed first responder
        billField.becomeFirstResponder()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercents[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if !billField.text!.isEmpty {
            placeHolderLabel.hidden = true
            UIView.animateWithDuration(0.4, animations: {
                self.resultView.alpha = 1
            })
            UIView.animateWithDuration(0.2, animations: {
                self.placeHolderLabel.frame.origin.y = 80
                self.billField.frame.origin.y = 80
            })
        }
        else {
            placeHolderLabel.hidden = false
            
            UIView.animateWithDuration(0.4, animations: {
                self.resultView.alpha = 0
            })
            UIView.animateWithDuration(0.2, animations: {
                self.placeHolderLabel.frame.origin.y = 175
                self.billField.frame.origin.y = 175
            })
        }
    }

}