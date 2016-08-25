//
//  TipsyVC.swift
//  TipsyApp
//
//  Created by Rickey Hrabowskie on 8/15/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class TipsyVC: UIViewController {

    // MARK: - @IBOutlets
    @IBOutlet weak var tipsyTitleView: UIView!
    @IBOutlet weak var tipsyTitleLbl: UILabel!
    @IBOutlet weak var billAmountTF: UITextField!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    // MARK: - @Properties
    
    var tipCalc = TipCalc(billAmount: 0.0, tipPercent: 0.0)
    
    // MARK: - Initialize Views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentValue() 
    }

    // MARK: - @IBActions 
    @IBAction func billAmountChanges(_ sender: AnyObject) {
        calcTip()
    }
    @IBAction func tipPercentChanges(_ sender: AnyObject) {
        tipPercentValue()
        calcTip()
    }
    
    // MARK: - Functions
    
    func calcTip() {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        tipCalc.billAmount = ((billAmountTF.text)! as NSString).doubleValue
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tipCalc.tipAmount)
        totalAmountLbl.text = String(format: "$%0.2f", tipCalc.totalAmount)
    }
    
    func tipPercentValue() {
        tipPercentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }
}

