//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tejal Par on 9/8/14.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.floatForKey("tip")
        
        if(tipValue >= 0.18 && tipValue < 0.20){
            tipControl.selectedSegmentIndex = 0
        }
        else if(tipValue >= 0.20 && tipValue < 0.22){
            tipControl.selectedSegmentIndex = 1
        }
        else if(tipValue >= 0.22){
            tipControl.selectedSegmentIndex = 2
        }
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        
        var tipAmount = billAmount * tipPercentage
        var total = billAmount + tipAmount
        
        tipLabel.text = "$\(tipAmount)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var settingsItem: UIBarButtonItem!
    
    @IBAction func onClick(sender: AnyObject) {
        
    }
    
}

