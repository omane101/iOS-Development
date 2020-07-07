//
//  TipCalculatorConstants.swift
//  TipCalculator
//
//  Created by Mohamed Omane on 7/7/20.
//  Copyright © 2020 Mohamed Omane. All rights reserved.
//

import Foundation


var bill: Double = 0.00
var tipPercentageAmount: Double = 0.00
var tip: Double = 0.00
var total: Double = 0.00


func calculateNewTip() {
    tip = bill * tipPercentageAmount
    total = bill + tip
}

