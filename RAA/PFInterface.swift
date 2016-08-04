//
//  PFInterface.swift
//  RAA
//
//  Created by Timothy Barrett on 8/3/16.
//  Copyright © 2016 tb. All rights reserved.
//
/*
 Facebook login session is cached so we need to check for facebook errors/invalid sessions whenever making a facebook request (if we make a FB request). 
*/

import Foundation
import Parse
import ParseFacebookUtilsV4
import FBSDKCoreKit
import SwiftyJSON
public class PFInterface : NSObject {
    static func authenticate(completion:(error:NSError?)->Void) {
        let permissions:[String] = ["public_profile", "email"]
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) { (user, error) in
            print(user)
            if error == nil {
                if user != nil {
                    PFInterface.requestFacebookProfileInBackground()
                    completion(error: nil)
                } else {
                    completion(error: PFInterface.createError(withMessage: "Cannot login with Facebook. Please try again later."))
                }
            } else {
                print(error)
            }
        }
    }
    
    static func needsReauthenticationWithFacebook() -> Bool {
        if PFUser.currentUser() != nil {
            return !PFFacebookUtils.isLinkedWithUser(PFUser.currentUser()!)
        }
        return true
    }
    
    static func requestFacebookProfileInBackground() {
        let request = FBSDKGraphRequest(graphPath: "/me", parameters: nil)
        request.startWithCompletionHandler { (connection, object, error) in
            if error == nil {
                if let obj = object as? [String : AnyObject] {
                    guard let id = obj["id"] as? String else { return }
                    let user = PFUser.currentUser()
                    user?["fbID"] = id
                    user?.saveInBackground()
                }
            } else {
                self.createError(withMessage: error.localizedDescription)
            }
        }
    }
    
    private static func createError(withMessage message:String) -> NSError {
        return NSError(domain: "PFInterface", code: 0, userInfo: [NSLocalizedDescriptionKey:message])
    }
}