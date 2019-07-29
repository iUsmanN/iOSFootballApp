//
//  NewsFeedVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 16/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class NewsFeedVC: UIViewController {
    
    //View variables
    @IBOutlet weak var tableview    : UITableView!
    
    //Object variables
    var segueItem                   : NewsFeedItem?
    var vm                          = NewsFeedVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewsFeed()
        vm.getData(pagination: updateTableView)
    }
}

extension NewsFeedVC {
    func setupNewsFeed() {
        tableview.dataSource = self
        tableview.backgroundColor = UIColor.clear
        tableview.register(TPConstants.Nibs.FACT_TVC, forCellReuseIdentifier: "FACT")
        tableview.register(TPConstants.Nibs.NEWS_TVC, forCellReuseIdentifier: "NEWS")
        tableview.register(TPConstants.Nibs.VIDEO_TVC, forCellReuseIdentifier: "VIDEO")
    }
}

extension NewsFeedVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        vm.getPaginatedData(indexPath: indexPath)
        
        let item : NewsFeedItem = vm.itemAt(indexPath)
        
        switch item.type
        {
        case 1:
            print("Video")
            if let cell = tableView.dequeueReusableCell(withIdentifier: "VIDEO", for: indexPath) as? VideoTVC {
                cell.item = vm.itemAt(indexPath)
                cell.backgroundColor = UIColor.clear
                cell.shareDelegate = self
                cell.descriptionDelegate = self
                return cell
            } else { print("Error dequeing Video cell") }
        case 2:
            print("Fact")
            if let cell = tableview.dequeueReusableCell(withIdentifier: "FACT", for: indexPath) as? FactTVC {
                cell.item = vm.itemAt(indexPath)
                cell.backgroundColor = UIColor.clear
                cell.shareDelegate = self
                cell.descriptionDelegate = self
                return cell
            } else { print("Error dequeing Fact cell") }
        case 3:
            print("News Item")
            if let cell = tableview.dequeueReusableCell(withIdentifier: "NEWS", for: indexPath) as? NewsLinkTVC {
                cell.item = vm.itemAt(indexPath)
                cell.shareDelegate = self
                cell.descriptionDelegate = self
                cell.backgroundColor = UIColor.clear
                return cell
            } else { print("Error dequeing News cell") }
        default:
            print("Error in classifying NF Item")
        }
        let cell : UITableViewCell = UITableViewCell()
        return cell;
    }
}

extension NewsFeedVC : ShareItemDelegate {
    func newsFeedItemShared(input: NewsFeedItem?) {
        if let item = input {
            let vc = UIActivityViewController(activityItems: [item.title as Any, item.url as Any], applicationActivities: [])
            present(vc, animated: true, completion: nil)
        }
    }
}

extension NewsFeedVC : ShowDescriptionDelegate {
    func showDescription(input: NewsFeedItem?) {
        guard let input = input else { return }
        
        if input.type == 1 {
            print("Video")
            segueItem = input
            self.performSegue(withIdentifier: "showVideoDetails", sender: self)
        } else {
            print("Fact or NF")
            segueItem = input
            self.performSegue(withIdentifier: "showItemDetails", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVideoDetails" {
            print("Video Segue")
            if let vc = segue.destination as? VideoDetailsVC {
                vc.item = segueItem
            }
        } else if segue.identifier == "showItemDetails" {
            print("Fact or NF Segue")
            if let vc = segue.destination as? ItemDetailsVC {
                vc.item = segueItem
            }
        }
    }
}

extension NewsFeedVC {
    
    /// Inserts new NewsFeed items to the table view
    ///
    /// - Parameter inputCount: Number of items to be inserted
    func updateTableView(inputCount: Int) {
        tableview.beginUpdates()
        for i in (1...inputCount).reversed() {
            tableview.insertRows(at: [IndexPath(row: vm.numberOfItems(in: 0) - i, section: 0)], with: .bottom)
        }
        tableview.endUpdates()
    }
}
