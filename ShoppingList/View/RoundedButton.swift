//
//  RoundedButton.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-11-08.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit

class RoundedButton: UIView {
    
    func setButton() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 0.1
    }
}
