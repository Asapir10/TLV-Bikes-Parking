//
//  ViewController.swift
//  ParkYourRiding
//
//  Created by USER on 09/10/2018.
//  Copyright © 2018 USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var desc2Label: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.alpha = 0
        descLabel.alpha = 0
        desc2Label.alpha = 0
        startBtn.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2, animations:{
            self.welcomeLabel.alpha = 0.6
            
        }) {(true) in
            self.showTitle()
        }
    }
    
    func showTitle(){
        UIView.animate(withDuration: 1, animations: {
            self.descLabel.alpha = 1
            }, completion: {(true) in
                self.showDesc()
        })
    }
    
    func showDesc(){
        UIView.animate(withDuration: 1, animations: {
            self.desc2Label.alpha = 1
        })
        {(true) in
            self.showButton()
        }
    }
    
    func showButton(){
        UIView.animate(withDuration: 1, animations: {
            self.startBtn.alpha = 1
            })
    }

}

