//
//  Extensions.swift
//  Universal Blog
//
//  Created by Fernando Augusto de Marins on 30/06/16.
//  Copyright © 2016 Fernando, Inc. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func alertViewWithTitle(title:String, message:String) {
        
        // UIAlertController
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func errorAlert(message:String) {
        alertViewWithTitle("Atenção", message: message)
    }
    
    func successAlert(message:String) {
        alertViewWithTitle("Sucesso", message: message)
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.sharedApplication().canOpenURL(url)
            }
        }
        
        return false
    }
}