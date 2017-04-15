//
//  ViewController.swift
//  Caculator
//
//  Created by Cntt02 on 4/15/17.
//  Copyright © 2017 Cntt02. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var bntKetqua: UITextField!
    
    var ketqua = Double()
    var Number = Double()
    var current0p = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        bntKetqua.text = ""
        // Do any additional setup after loading the view, typically from a nib.
        bntKetqua.delegate = self
        current0p = "="
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func bntNumberinut(_ sender: UIButton) {
        Number = Number * 10 + Double ( sender.titleLabel!.text!)!
        bntKetqua.text = ("\(Number)")
    }

   
    @IBAction func bntTinh(_ sender: UIButton) {
        switch current0p {
            case "=":
                ketqua = Number
            case "+":
                ketqua = ketqua + Number
            case "-":
                if (bntKetqua.text?.isEmpty)! {
                    bntKetqua.text = "-"
                } else {
                    ketqua = ketqua - Number
                }
            case "*":
                ketqua = ketqua * Number
            case "/":
                ketqua = ketqua / Number
        default:
            print("error")
        }
        Number = 0
        bntKetqua.text = ("\(ketqua)")
        
        if (sender.titleLabel!.text == "="){
            ketqua=0
        }
        current0p = sender.titleLabel!.text! as String!
    }
    @IBAction func bntClear(_ sender: UIButton) {
        ketqua = 0
        Number = 0
        current0p = "="
        bntKetqua.text = ("\(ketqua)")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                }else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                return false
            }
        }
    }
    
   /* @IBAction func NumericAction(_ sender: Any) {
        if(bntKetqua.text?.isEmpty)! {
            bntKetqua.text = "0."
        } else {
            let countdots = bntKetqua.text!.components(separatedBy:".").count - 1
            if countdots == 0 {
                bntKetqua.text = bntKetqua.text! + "."
            }
        }
    }*/
}

