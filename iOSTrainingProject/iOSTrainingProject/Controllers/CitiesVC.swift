//
//  CitiesVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 24/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class CitiesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: CitiesVM?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        viewModel = CitiesVM(closure: {
            self.tableView.reloadData()
        })
        
        viewModel?.getCityData()
    }
}

extension CitiesVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfItems(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityTVC
        
        cell.item = viewModel?.getItemAt(indexPath: indexPath)
        
        return cell
    }
    
    
}
