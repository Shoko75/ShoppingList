//
//  item.swift
//  ShoppingList
//
//  Created by Shoko Hashimoto on 2019-10-25.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import Foundation

// MARK: - Model

struct ItemDataModel {
    var isCompleted: Bool
    var storeInfomation: Store
    let itemTitle: String
}

// MARK: - Model Data

let item1 = ItemDataModel(isCompleted: false, storeInfomation: Store(storeName: "Save on Foods"), itemTitle: "Buy bread")
let item2 = ItemDataModel(isCompleted: false, storeInfomation: Store(storeName: "London Drugs"), itemTitle: "Buy Cereal")
let item3 = ItemDataModel(isCompleted: false, storeInfomation: Store(storeName: "Safeway"), itemTitle: "Buy toilet paper")
