//
//  MainViewController.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-11-08.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mapButton: RoundedButton!
    
    
    @IBOutlet weak var allButton: RoundedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapButton.setButton()
        allButton.setButton()
        
    }
}
