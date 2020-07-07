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
        // Do any addiional setup after loading the view.
        self.title = "Tipping Calculator"
        self.updateLabels()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        bill = Double(billedAmountTextField.text!) ?? 0
        
        calculateNewTip()
        
        updateLabels()
    }
    
    func updateLabels() {
        tipPercentageLabel.text = String(format: "$%.2f", tip) //"$\(tip)"
        totalLabel.text = String(format: "$%.2f", total) //"$\(total)"
    }
    
}

