//
//  ViewController.swift
//  Calculator
//
//  Created by Tianyu Liang on 12/29/17.
//  Copyright © 2017 Tianyu Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billLabel: UITextField!
    
    @IBOutlet weak var option: UISegmentedControl!
    
    @IBOutlet weak var custom: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator";
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any)
    {
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(_ sender: Any)
    {
        if(option.selectedSegmentIndex < 3)
        {
            let bill = Double(billLabel.text!) ?? 0;
            var tipOptions = [0.1, 0.15, 0.2];
            let decide = option.selectedSegmentIndex;
            let tip = bill * tipOptions[decide];
            let total = bill + tip;
            tipLabel.text = String(format: "$%.2f", tip);
            totalLabel.text = String(format: "$%.2f", total);
        }
        else
        {
            customTip(custom);
        }
        
    }
    
  
    @IBAction func customTip(_ sender: UITextField)
    {
        let bill = Double(billLabel.text!) ?? 0;
        let multiplier = Double(sender.text!) ?? 0;
        let tip = bill * multiplier / 100;
        let total = bill + tip;
        tipLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "$%.2f", total);
    }

}

