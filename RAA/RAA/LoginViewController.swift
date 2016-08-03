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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginFacebookPressed(sender: AnyObject) {
        PFInterface.authenticate { (error) in
            print(error)
            self.performSegueWithIdentifier("showGameBoard", sender: nil)
        }
    }

}
