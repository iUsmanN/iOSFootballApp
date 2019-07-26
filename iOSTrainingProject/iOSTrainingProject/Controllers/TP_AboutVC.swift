//
//  TP_AboutVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 26/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class TP_AboutVC: UIViewController {

    @IBOutlet weak var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addLabel()
    }
}

extension TP_AboutVC {
    func addLabel() {
        let myAttribute2    = [ NSAttributedString.Key.backgroundColor: UIColor.yellow ]
        let mystring        = NSAttributedString(string: "This is an attributed string.", attributes: myAttribute2)
        
        label.attributedText = mystring
        
        
    }
}
