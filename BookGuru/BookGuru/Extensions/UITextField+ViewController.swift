//
//  UITextField+ViewController.swift
//  BookGuru
//
//  Created by Assumani, Medi on 3/7/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

/*
    Extending the ShowBookViewController to add special functionality
    to the keyboard. When the user taps "return" key, the cursor goes
    to the text field below.
 
 Special Thanks to : Bart Jacobs from cocoacasts.com
 */

extension ShowBookViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        switch textField {
        case bookNameTextField:
            authorTextField.becomeFirstResponder()
        case authorTextField:
            lastPageReadTextField.becomeFirstResponder()
        case lastPageReadTextField:
            lastLineReadTextField.becomeFirstResponder()
        default:
            lastLineReadTextField.resignFirstResponder()
            
        }
        return true
    }
}
