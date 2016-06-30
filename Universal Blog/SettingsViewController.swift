//
//  SettingsViewController.swift
//  Universal Blog
//
//  Created by Fernando Augusto de Marins on 28/06/16.
//  Copyright © 2016 Fernando, Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,
    UITextFieldDelegate {
    
    @IBOutlet weak var urlTextField: UITextField!
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seguePresentMainVC" {
            let controller = segue.destinationViewController as! MainViewController
            if let safeURL = urlTextField.text {
                if verifyUrl(safeURL) {
                    controller.url = safeURL
                } else {
                    alertViewWithTitle("Attention!", message: "The URL entered is not valid!")
                }
            } else {
                alertViewWithTitle("Attention!", message: "Please add an address!")
            }
        }
    }
        
    @IBAction func confirmUrl(sender: AnyObject) {
        performSegueWithIdentifier("seguePresentMainVC", sender: self)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        confirmUrl(self)
        return true
    }
}
