//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Tejal Par on 9/8/14.

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var setTipButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onTouchUpInside(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func setTipOnTouchUpInside(sender: AnyObject) {
        
        //Read from text field
        //var tipAmount = tipText.text._bridgeToObjectiveC().floatValue
        
        var tipPercentages = [0.18, 0.2, 0.22]
        
        let tipAmount = tipPercentages[tipControl.selectedSegmentIndex]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipAmount, forKey: "tip")
        defaults.synchronize()
    }
    
    func loadDefaults(){
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipValue = defaults.floatForKey("tip")
        
        //Show in text field
        //tipText.text = String(format: "%.2f", tipValue)
    }
    
}
