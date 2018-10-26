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
    var displayInput : String = "0"
    
    var input : Float = 0
    var inputStore : Float = 0
    var numSign : String = ""
    
    var returnResult : Float = 0
    
    var numInput : Bool = false
    var resultInput : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numButton(_ sender: UIButton) {
        
        // IF THE INPUT IS NUMBER
        if (sender.tag < 10 || sender.tag == 12 || sender.tag == 18) {
            if (sender.tag == 12) {
                if displayInput.range(of:".") != nil {
                    print("Decimal already exists") // Input decimal places more than once
                } else {
                    displayInput += "." // Adding decimal places
                }
            } else if (sender.tag == 18) { // Remove last digit
                if (displayInput.count < 2) {
                    displayInput = "0"
                } else {
                    displayInput.remove(at: displayInput.index(before: displayInput.endIndex))
                }
            } else {
                if (displayInput == "0") {
                    displayInput = ""
                }
                displayInput += String(sender.tag)
            }
            
            input = Float(displayInput) ?? 0
            calcDisplay.text = displayInput
            
            numInput = true
            resultInput = false
            
        } else {
            
            // IF THE INPUT IS SYMBOLS
            // ====================== INPUT -> = EQUAL
            displayInput = ""
            
            if (sender.tag == 10) {
                if (numSign == "+") {
                    returnResult = inputStore + input
                } else if (numSign == "-") {
                    returnResult = inputStore - input
                } else if (numSign == "x") {
                    returnResult = inputStore * input
                } else if (numSign == "/") {
                    returnResult = inputStore / input
                } else if (numSign == "") {
                    returnResult = input
                    input = 0
                }
                numSign = "="
                calcDisplay.text = String(returnResult.clean)
                
            // ====================== INPUT -> + ADDITION
            } else if (sender.tag == 13) {
                if (numSign == "+") {
                    inputStore += input
                } else if (numInput == true) {
                    inputStore = input
                } else if (resultInput == true) {
                    inputStore = returnResult
                }
                
                numSign = "+"
                calcDisplay.text = String(inputStore.clean)
                
            // ====================== INPUT -> - SUBTRATION
            } else if (sender.tag == 14) {
                
                if (numSign == "-") {
                    inputStore -= input
                } else if (numInput == true) {
                    inputStore = input
                } else if (resultInput == true) {
                    inputStore = returnResult
                }
                
                numSign = "-"
                calcDisplay.text = String(inputStore.clean)
            
            // ====================== INPUT -> x MULTIPLICATION
            } else if (sender.tag == 15) {
                
                if (numSign == "x") {
                    inputStore *= input
                } else if (numInput == true) {
                    inputStore = input
                } else if (resultInput == true) {
                    inputStore = returnResult
                }
                
                numSign = "x"
                
                calcDisplay.text = String(inputStore.clean)
                
            } else if (sender.tag == 16) {
                
                if (numSign == "/") {
                    inputStore /= input
                } else if (numInput == true) {
                    inputStore = input
                } else if (resultInput == true) {
                    inputStore = returnResult
                }
                
                numSign = "/"
                
                calcDisplay.text = String(inputStore.clean)
                
            } else if (sender.tag == 17) { // %
                
            // ====================== INPUT -> AC/C
            } else if (sender.tag == 19) {
                // RESET EVERYTHING!
                input = 0
                inputStore = 0
                returnResult = 0
                numSign = ""
                
                calcDisplay.text = String(inputStore.clean)
            }
            
            numInput = false
            resultInput = true
            input = 0
            
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

// Clean - Remove any flying '0's on decimal (or remove dec)
extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
