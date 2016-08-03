//
//  SplashViewController.swift
//  RAA
//
//  Created by Timothy Barrett on 8/3/16.
//  Copyright © 2016 tb. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if PFInterface.needsReauthenticationWithFacebook() {
            // user not logged into FB or no current user is on this device
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = sb.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            self.presentViewController(loginVC, animated: true, completion: nil)
            
        } else {
            // user is logged in but don't know about the session...be careful
            performSegueWithIdentifier("showGameBoard", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
