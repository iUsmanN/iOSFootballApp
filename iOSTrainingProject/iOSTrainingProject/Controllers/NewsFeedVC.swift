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
    var segueItem: NewsFeedItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNewsFeed()
        vm.getData(pagination: updateTableView)
    }
    
    func setupNewsFeed()
    {
        tableview.dataSource = self
        tableview.backgroundColor = UIColor.clear
        let factNib = UINib(nibName: "FactTVC", bundle: nil)
        tableview.register(factNib, forCellReuseIdentifier: "FACT")
        let newsNib = UINib(nibName: "NewsLinkTVC", bundle: nil)
        tableview.register(newsNib, forCellReuseIdentifier: "NEWS")
        let videoNib = UINib(nibName: "VideoTVC", bundle: nil)
        tableview.register(videoNib, forCellReuseIdentifier: "VIDEO")
    }
}

//struct TPConstants {
//    private init(){}
//     struct Nibs {
//        private init(){}
//        static let FACT_TVC = UINib(nibName: "FactTVC", bundle: nil)
//    }
//}

extension NewsFeedVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //pagination code here
        vm.getPaginatedData(indexPath: indexPath)
        
        let item : NewsFeedItem = vm.itemAt(indexPath)
        
        switch item.type
        {
        case 1:
            print("Video")
            let cell = tableView.dequeueReusableCell(withIdentifier: "VIDEO", for: indexPath) as! VideoTVC
            cell.item = vm.itemAt(indexPath)
            cell.backgroundColor = UIColor.clear
            cell.shareDelegate = self
            cell.descriptionDelegate = self
            return cell
            
        case 2:
            print("Fact")
            let cell = tableview.dequeueReusableCell(withIdentifier: "FACT", for: indexPath) as! FactTVC
            cell.item = vm.itemAt(indexPath)
            cell.backgroundColor = UIColor.clear
            cell.shareDelegate = self
            cell.descriptionDelegate = self
            return cell
            
        case 3:
            print("News Item")
            let cell = tableview.dequeueReusableCell(withIdentifier: "NEWS", for: indexPath) as! NewsLinkTVC
            cell.item = vm.itemAt(indexPath)
            cell.shareDelegate = self
            cell.descriptionDelegate = self
            cell.backgroundColor = UIColor.clear
            return cell
            
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
    
    func updateTableView(inputCount: Int) {
        tableview.beginUpdates()
        for i in (1...inputCount).reversed() {
        tableview.insertRows(at: [IndexPath(row: vm.numberOfItems(in: 0) - i, section: 0)], with: .bottom)
        }
        tableview.endUpdates()
    }
}
