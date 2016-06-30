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
    
    // Mark: - Constants/Variables
    let segueToMain = "toMainVC"
    
    // Mark: - Outlets
    @IBOutlet weak var urlTextField: UITextField!
    
    // Mark: - Lifecycle methods
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
    }
    
    // Mark: - Methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        confirmUrl(self)
        return true
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == segueToMain {
            let controller = segue.destinationViewController as! MainViewController
            if let safeURL = urlTextField.text {
                if verifyUrl(safeURL) {
                    controller.url = safeURL
                } else {
                    dispatch_async(dispatch_get_main_queue(), { 
                        self.alertViewWithTitle("Attention!", message: "The URL entered is not valid!")
                    })
                    
                }
            } else {
                dispatch_async(dispatch_get_main_queue(), { 
                    self.alertViewWithTitle("Attention!", message: "Please add an address!")
                })
                
            }
        }
    }
    
    // Mark: - Actions
    @IBAction func confirmUrl(sender: AnyObject) {
        performSegueWithIdentifier(segueToMain, sender: self)
    }

}
