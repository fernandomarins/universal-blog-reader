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
        sampleURL()
    }
    
    func sampleURL() {
        urlTextField.text = "https://www.wantedly.com/projects.xml"
    }
    
    // Mark: - Private methods
    private func request() {
        
        if let safeURL = urlTextField.text {
            if verifyUrl(safeURL) {
                Server.sharedInstace.request(safeURL)
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
    
    // Mark: - Textfield Delegate Methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        confirmUrl(self)
        return true
    }
    
    // Mark: - Actions
    @IBAction func confirmUrl(sender: AnyObject) {
        performSegueWithIdentifier(segueToMain, sender: self)
    }
    
    @IBAction func makeRequest(sender: AnyObject) {
        request()
    }
}
