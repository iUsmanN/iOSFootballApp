//
//  PlayersVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 21/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class PlayersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let vm = PlayersVM()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersTableViewCell", for: indexPath) as! PlayersTVC
        
        cell.item = vm.getItem(at: indexPath)
        
        //add pagination code here
        
        return cell
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
    
    func getImageOfCell(at indexPath: IndexPath) -> UIImage? {
        let cell = tableView.cellForRow(at: indexPath) as? PlayersTVC
        return cell?.flag.image
    }
}
