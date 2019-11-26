//
//  NewStoreCollectionViewCell.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-11-22.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit

class NewStoreCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    
    func setLabel(store: StoreViewModel) {
        label.text = store.storeName
    }
}
