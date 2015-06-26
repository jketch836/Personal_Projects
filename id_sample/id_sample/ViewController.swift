//
//  ViewController.swift
//  id_sample
//
//  Created by Josh Ketcham on 3/7/15.
//  Copyright (c) 2015 jketch. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    var touchIDContext = LAContext()
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.label.text = "Boy"
        // Declare a NSError variable.
        var error: NSError?
        
        // Set the reason string that will appear on the authentication alert.
        var reasonString = "Authentication is needed."
        
        
        if touchIDContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            touchIDContext.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) {
                (success: Bool, error: NSError!) -> Void in
                
                if success {
                    println("Success")
                    
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        self.label.text = "Hello"
                        
                    })
                    
                    
                } else {
                    println("Error: \(error)")
                }
            }
            
        } else {
            
            self.label.text = "Hello"
            
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showAlertController(message: String) {
        
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    
}

