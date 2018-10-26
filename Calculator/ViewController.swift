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
    var displayInput : String = ""
    
    var input : Int = 0
    var inputStore : Int = 0
    var numSign : String = ""
    
    var returnResult : Int = 0
    
    var numInput : Bool = false
    var resultInput : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numButton(_ sender: UIButton) {
        
        // IF THE INPUT IS NUMBER
        if (sender.tag < 10) {
            displayInput += String(sender.tag)
            input = Int(displayInput) ?? 0
            calcDisplay.text = displayInput
            
            numInput = true
            resultInput = false
            
        } else {
            
            // IF THE INPUT IS SYMBOLS
            // ====================== INPUT -> =
            
            displayInput = ""
            
            if (sender.tag == 10) {
                if (numSign == "+") {
                    returnResult = inputStore + input
                } else if (numSign == "") {
                    returnResult = input
                    input = 0
                }
                numSign = "="
                calcDisplay.text = String(returnResult)
                
                numInput = false
                resultInput = true
                
            // ====================== INPUT -> +
            } else if (sender.tag == 13) {
                if (input > 0 && numSign != "=") {
                    inputStore += input
                } else if (numInput == true) {
                    inputStore = input
                } else if (resultInput == true) {
                    inputStore = returnResult
                }
                
                numSign = "+"
                input = 0
                
                calcDisplay.text = String(inputStore)
                
                numInput = false
                resultInput = true
            // ====================== INPUT ->
            } else if (sender.tag == 17) { // %
                
            // ====================== INPUT -> AC/C
            } else if (sender.tag == 19) {
                input = 0
                inputStore = 0
                returnResult = 0
                
                calcDisplay.text = String(input)
            }
        }
        
        print("inputStore", inputStore, "input", input, "returnResult", returnResult, "numSign", numSign)
    }
    
//    func toggleInputSetting (_ numSetting: Bool, _ resSetting: Bool) {
//        if (numSetting == false && resSetting == true) {
//            numInput = true
//            resultInput = false
//        } else if (numSetting == true && resSetting == false) {
//            numInput = false
//            resultInput = true
//        }
//    }
    
    
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

