//
//  TeamsVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 17/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class TeamsVC: UIViewController {
    
    //View variables
    @IBOutlet weak var tableView    : UITableView!
    
    //Object variables
    var vm                          : TeamsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }
}

extension TeamsVC {
    
    /// Sets up view model
    func setupViewModel(){
        vm = TeamsVM({ self.tableView.reloadData() })
        vm?.getData()
    }
    
    /// Sets up the table view
    func setupTableView() {
        tableView.dataSource    = self
        tableView.delegate      = self
    }
}

extension TeamsVC : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getNumberOfRows(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell     = tableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell", for: indexPath) as? RankingTableViewCell {
            cell.item   = vm?.getItemForRow(at: indexPath)
            vm?.getPaginatedData(indexPath: indexPath)
            return cell
        } else {
            print("Error dequeing Teams cell")
        }
        return UITableViewCell()
    }
}

extension TeamsVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetails") {
            if let destination = segue.destination as? DetailsVC {
                destination.item        = vm?.getItemForRow(at: tableView.indexPathForSelectedRow ?? IndexPath(row: 0, section: 0))
                destination.cellImage   = getImageOfCell(at: tableView.indexPathForSelectedRow ?? IndexPath(row: 0, section: 0))
            }
        }
    }
    
    /// Gets the image of the cell displayed in the table view
    ///
    /// - Parameter indexPath: Indexpath of the cell
    /// - Returns: Image of the given cell
    func getImageOfCell(at indexPath: IndexPath) -> UIImage? {
        let cell = tableView.cellForRow(at: indexPath) as? RankingTableViewCell
        return cell?.flag.image
    }
}
