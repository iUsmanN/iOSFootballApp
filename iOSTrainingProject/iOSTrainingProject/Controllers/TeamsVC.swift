//
//  TeamsVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class TeamsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var vm: TeamsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        vm = TeamsVM({
            self.tableView.reloadData()
        })
        
        vm?.getData()
    }
}


extension TeamsVC : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getNumberOfRows(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell", for: indexPath) as! RankingTableViewCell
        
        cell.item = vm?.getItemForRow(at: indexPath)
        cell.item?.ranking = indexPath.row+1
        
        return cell
    }
    
    
}
