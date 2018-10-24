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
    var numSign : Any?
    
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
        } else { // IF THE INPUT IS SYMBOLS
            if (sender.tag == 10) { // =
                print("=")
            } else if (sender.tag == 13) { // +
//                numSign = "+"
                print("Plus +")
            } else if (sender.tag == 17) {
                
            } else if (sender.tag == 19) {
                input = "0"
            }
        }
        
        
        print(input)
        calcDisplay.text = input
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

