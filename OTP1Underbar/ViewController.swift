//
//  ViewController.swift
//  OTP1Underbar
//
//  Created by Boppo Technologies on 28/05/19.
//  Copyright © 2019 Boppo Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var txtOPT1: UITextField!
    
    
    @IBOutlet weak var txtOPT2: UITextField!
    
    @IBOutlet weak var txtOPT3: UITextField!
    
    @IBOutlet weak var txtOPT4: UITextField!
    
    @IBOutlet weak var stackView: UIView!{
        didSet{
            
            for textView in stackView.subviews{
              //  (textView as! UITextField).delegate = self
                
                //addBottomBorder(to: textView as! UITextField)
            }
        }
    }
    
    override func viewDidLoad() {
        //   addBottomBorder(to: txtOPT1)
        //  addBottomBorder(to: txtOPT2)
        //  addBottomBorder(to: txtOPT3)
        //   addBottomBorder(to: txtOPT4)
        txtOPT1.delegate = self
        txtOPT2.delegate = self
        txtOPT3.delegate = self
        txtOPT4.delegate = self
    }
    
    //    @IBAction func editingChanged(_ sender: UITextField) {
    //        let text = sender.text
    //
    //        if text?.count == 1 {
    //
    //            switch sender{
    //
    //
    //            case txtOPT1:
    //                txtOPT2.becomeFirstResponder()
    //            case txtOPT2:
    //                txtOPT3.becomeFirstResponder()
    //            case txtOPT3:
    //                txtOPT4.becomeFirstResponder()
    //            case txtOPT4:
    //                txtOPT4.resignFirstResponder()
    //            default:
    //                break
    //            }
    //        }
    //
    //    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count)! < 1 && (string.count > 0){
            switch textField{
                
            case txtOPT1:
                txtOPT2.becomeFirstResponder()
            case txtOPT2:
                txtOPT3.becomeFirstResponder()
            case txtOPT3:
                txtOPT4.becomeFirstResponder()
            case txtOPT4:
                txtOPT4.resignFirstResponder()
            default:
                break
            }
            
            textField.text = string
            return false
        }
        else if(textField.text?.count)! >= 1 &&  string.count == 0{
            switch textField{
                
            case txtOPT4:
                txtOPT3.becomeFirstResponder()
            case txtOPT3:
                txtOPT2.becomeFirstResponder()
            case txtOPT2:
                txtOPT1.becomeFirstResponder()
            case txtOPT1:
                txtOPT1.resignFirstResponder()
            default:
                break
            }
            
            textField.text = ""
            return false
        }
       
        else if (textField.text?.count)! >= 1 && string.count > 0{
            
            switch textField{
                
            case txtOPT1:
                txtOPT2.becomeFirstResponder()
            case txtOPT2:
                txtOPT3.becomeFirstResponder()
            case txtOPT3:
                txtOPT4.becomeFirstResponder()
            case txtOPT4:
                txtOPT4.resignFirstResponder()
            default:
                break
            }
            
            textField.text = string
            return false
        }
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         txtOPT1.becomeFirstResponder()
    }
    func addBottomBorder(to textField : UITextField){
        
        let layer = CALayer()
        
        layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        layer.frame = CGRect(x: 0, y: textField.frame.size.height - 2, width: textField.frame.size.width, height: 2)
        
        textField.layer.addSublayer(layer)
    }
}

