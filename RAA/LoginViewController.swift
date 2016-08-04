//
//  LoginViewController.swift
//  RAA
//
//  Created by Timothy Barrett on 8/3/16.
//  Copyright © 2016 tb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginFacebookPressed(sender: AnyObject) {
        PFInterface.authenticate { (error) in
            print(error)
            if error == nil {
                self.performSegueWithIdentifier("showGameBoard", sender: nil)
            } else {
                
            }
            
        }
    }
    
    private func displayError(message:String) {
        let alertVC = UIAlertController(title: "Oops", message: message, preferredStyle: .Alert)
        let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
        alertVC.addAction(okayAction)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
}
