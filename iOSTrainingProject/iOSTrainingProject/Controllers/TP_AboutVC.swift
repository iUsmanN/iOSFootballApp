//
//  TP_AboutVC.swift
//  iOSTrainingProject
//
//  Created by Usman Nazir on 26/07/2019.
//  Copyright © 2019 Usman Nazir. All rights reserved.
//

import UIKit

class TP_AboutVC: UIViewController {

    //View variables
    @IBOutlet weak var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
    }
}

extension TP_AboutVC {
    
    
    /// Adds the text to the attributed text label in the view
    func addLabel() {
        let myAttribute2    = [ NSAttributedString.Key.backgroundColor: UIColor.yellow ]
        let mystring        = NSAttributedString(string: "This is an attributed string.", attributes: myAttribute2)
        label.attributedText = mystring
    }
}
