//
//  ViewController.swift
//  TipCalculator
//
//  Created by Mohamed Omane on 7/3/20.
//  Copyright © 2020 Mohamed Omane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billedAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var customTipTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billedAmountTextField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let index = tipControl.selectedSegmentIndex
        var tip = 0.0
        var total = 0.0
        
        if index == 3 {
            let customTip = Double(customTipTextField.text!) ?? 0
            tip = bill * (Double(customTip/100.00))
            total = bill + tip
        } else {
            tip = bill * tipPercentages[index]
            total = bill + tip
        }
        
        
        // Update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip) //"$\(tip)"
        totalLabel.text = String(format: "$%.2f", total) //"$\(total)"
    }
}

