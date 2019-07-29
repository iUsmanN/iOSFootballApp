//
//  CitiesVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 24/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class CitiesVC: UIViewController {

    //View variables
    @IBOutlet weak var tableView    : UITableView!
    
    //Object variables
    var viewModel                   : CitiesVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }
}

extension CitiesVC {
    
    /// Sets up the datasource for the table view
    func setupTableView() {
        tableView.dataSource = self
    }
    
    /// Sets up the view model and gets the city data
    func setupViewModel() {
        viewModel = CitiesVM(closure: {
            DispatchQueue.main.async { self.tableView.reloadData() }
        })
        viewModel?.getCityData()
    }
}

extension CitiesVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfItems(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityTVC {
        cell.item = viewModel?.getItemAt(indexPath: indexPath)
        return cell
        } else {
            print("Error dequeing Video cell")
        }
        return UITableViewCell()
    }
}
