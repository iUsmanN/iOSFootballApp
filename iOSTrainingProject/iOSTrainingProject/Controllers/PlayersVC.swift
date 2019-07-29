//
//  PlayersVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class PlayersVC: UIViewController {

    //View variables
    @IBOutlet weak var tableView    : UITableView!
    
    //Object variables
    let vm                          = PlayersVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }
}

extension PlayersVC {
    
    /// Sets up the tableview and adds its data source
    func setupTableView() {
        tableView.dataSource = self
    }
    
    /// Sets up the view model and gets data
    func setupViewModel () {
        vm.getData {
            self.tableView.reloadData()
        }
    }
}

extension PlayersVC : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getNumberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersTableViewCell", for: indexPath) as? PlayersTVC {
        cell.item = vm.getItem(at: indexPath)
        return cell
        } else {
            print("Error dequeing Players cell")
        }
        return UITableViewCell()
    }
}

extension PlayersVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let destination = segue.destination as? DetailsVC {
                destination.item = vm.getItem(at: tableView.indexPathForSelectedRow ?? IndexPath(row: 0, section: 0))
                destination.cellImage = getImageOfCell(at: tableView.indexPathForSelectedRow ?? IndexPath(row: 0, section: 0))
            }
        }
    }
    
    /// Gets the image of the cell displayed in the table view
    ///
    /// - Parameter indexPath: Indexpath of the cell
    /// - Returns: Image of the given cell
    func getImageOfCell(at indexPath: IndexPath) -> UIImage? {
        let cell = tableView.cellForRow(at: indexPath) as? PlayersTVC
        return cell?.flag.image
    }
}
