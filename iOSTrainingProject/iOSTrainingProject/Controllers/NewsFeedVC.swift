//
//  NewsFeedVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class NewsFeedVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var vm:NewsFeedVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vm = NewsFeedVM()
        vm?.getData()
    }
}
