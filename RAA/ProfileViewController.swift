//
//  ProfileViewController.swift
//  RAA
//
//  Created by Timothy Barrett on 8/3/16.
//  Copyright © 2016 tb. All rights reserved.
//

import UIKit
import Parse
class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        usernameLabel.text = PFUser.currentUser()?.username
        PFInterface.requestFacebookProfileInBackground()
    }

}
