//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Mohamed Omane on 7/6/20.
//  Copyright © 2020 Mohamed Omane. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var tipPercentageSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func tipAmount(_ sender: Any) {
        self.calculateTipAmount()
        calculateNewTip()
    }
    
    func calculateTipAmount() -> Void {
        let tipPercentages = [0.20, 0.18, 0.15]
        tipPercentageAmount = Double(customTipTextField.text!) ?? 0
        
        if tipPercentageAmount == 0 {
            print("custom tip is 0")
            let index = tipPercentageSegmentedControl.selectedSegmentIndex
            tipPercentageAmount = Double(tipPercentages[index])
        } else{
            print("tip is \(tipPercentageAmount)")
            tipPercentageAmount = tipPercentageAmount/100
        }
    }


}
