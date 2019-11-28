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
    var storeInfomation: StoreDataModel
    let itemTitle: String
}

// MARK: - Model Data

let item1 = ItemDataModel(isCompleted: false, storeInfomation: StoreDataModel(storeName: "Save on foods"), itemTitle: "Buy bread")

let item2 = ItemDataModel(isCompleted: false, storeInfomation: StoreDataModel(storeName: "London Drugs"), itemTitle: "Buy Cereal")
let item3 = ItemDataModel(isCompleted: false, storeInfomation: StoreDataModel(storeName: "Save on foods"), itemTitle: "Buy toilet paper")

struct CellData {
    var opened = Bool()
    var itemData: [ItemViewModel]
}


