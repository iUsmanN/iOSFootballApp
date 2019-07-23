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
    var vm = NewsFeedVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNewsFeed()
        // Do any additional setup after loading the view.
        vm = NewsFeedVM()
        vm.getData()
    }
    
    func setupNewsFeed()
    {
        tableview.dataSource = self
        tableview.backgroundColor = UIColor.clear
        let nib = UINib(nibName: "FactTVC", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "FACT")
        let nib2 = UINib(nibName: "NewsLinkTVC", bundle: nil)
        tableview.register(nib2, forCellReuseIdentifier: "NEWS")
    }
}

extension NewsFeedVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item : NewsFeedItem = vm.itemAt(indexPath)
        
        switch item.type
        {
        case 1:
            print("Video")
            
        case 2:
            print("Fact")
            let cell = tableview.dequeueReusableCell(withIdentifier: "FACT", for: indexPath) as! FactTVC
            cell.item = vm.itemAt(indexPath)
            cell.backgroundColor = UIColor.clear
            return cell
            
        case 3:
            print("News Item")
            let cell = tableview.dequeueReusableCell(withIdentifier: "NEWS", for: indexPath) as! NewsLinkTVC
            cell.item = vm.itemAt(indexPath)
            return cell
            
        default:
            print("Error in classifying NF Item")
        }
        var cell : UITableViewCell = UITableViewCell()
        return cell;
    }
}
