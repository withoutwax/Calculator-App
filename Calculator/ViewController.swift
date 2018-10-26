//
//  ViewController.swift
//  Calculator
//
//  Created by Will Kim on 10/16/18.
//  Copyright © 2018 Will Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calcDisplay: UILabel!
    
    var input : String = ""
    var input01 : Int = 0
    var numSign : String = ""
    
    var returnResult : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numButton(_ sender: UIButton) {
        
        // IF THE INPUT IS NUMBER
        if (sender.tag < 10) {
            if (input == "0") {
                input = ""
            }
            input += String(sender.tag)
            calcDisplay.text = input
            
        } else { // IF THE INPUT IS SYMBOLS
            
            if (sender.tag == 10) { // =
                print("=")
                if (numSign == "+") {
                    returnResult = input01 + (Int(input) ?? 0)
                }
                calcDisplay.text = String(returnResult)
                
            } else if (sender.tag == 13) { // +
                input01 = Int(input) ?? 0
                numSign = "+"
                input = "0"
                
                print("Plus +")
                calcDisplay.text = String(input01)
            } else if (sender.tag == 17) { // %
                
                
            } else if (sender.tag == 19) {
                input = "0"
            }
        }
        
        print("input01", input01)
        print("input", input)
        print("returnResult", returnResult)
    }
    
    
//    TAGS = SYMBOLS
//    10 = '='
//    11 = 'save'
//    12 = '.'
//    13 = '+'
//    14 = '-'
//    15 = 'x'
//    16 = '÷'
//    17 = '%'
//    18 = '+/-'
//    19 = 'AC/C'
    
}

