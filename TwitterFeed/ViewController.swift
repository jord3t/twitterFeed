//
//  ViewController.swift
//  TwitterFeed
//
//  Created by trevor jordet on 2/15/16.
//  Copyright © 2016 jord3t. All rights reserved.
//

import UIKit
import TwitterKit
import Twitter

class ViewController: UIViewController
{
    @IBOutlet weak var userNameLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let logInButton = TWTRLogInButton(logInCompletion:
        { session, error in
            if (session != nil)
            {
                print("signed in as \(session!.userName)");
                self.userNameLabel.text = session!.userName
                self.performSegueWithIdentifier("showTweets", sender: nil)
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destination = segue.destinationViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController!
        }
        if let tvc = destination as? UserTimelineViewController {
            tvc.userName = self.userNameLabel.text!
        }
    }
}