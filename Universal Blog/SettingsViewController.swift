//
//  SettingsViewController.swift
//  Universal Blog
//
//  Created by Fernando Augusto de Marins on 28/06/16.
//  Copyright © 2016 Fernando, Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var urlTextField: UITextField!
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seguePresentMainVC" {
            let controller = segue.destinationViewController as! MainViewController
            controller.url = urlTextField.text!
        }
    }
    
    @IBAction func confirmUrl(sender: AnyObject) {
        
        performSegueWithIdentifier("seguePresentMainVC", sender: self)
        
    }


}
