//
//  UserTimelineViewController.swift
//  TwitterFeed
//
//  Created by trevor jordet on 2/17/16.
//  Copyright © 2016 jord3t. All rights reserved.
//

import UIKit
import TwitterKit

class UserTimelineViewController: TWTRTimelineViewController {
    
    var userName: String = "jord3t"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: userName, APIClient: client)
    }
}
