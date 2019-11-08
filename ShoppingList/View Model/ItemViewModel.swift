//
//  ItemViewModel.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-10-29.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import Foundation

class ItemViewModel {
    
    private let itemDataModel: ItemDataModel
    
    init(itemDataModel: ItemDataModel) {
        self.itemDataModel = itemDataModel
    }
    
    public var itemName: String {
        return itemDataModel.itemTitle
    }
    
    public var isCompleted: Bool {
        return itemDataModel.isCompleted
    }
    
    public var store: StoreDataModel {
        return itemDataModel.storeInfomation
    }
}

var itemViewModel: [ItemViewModel] = [ItemViewModel(itemDataModel: item1), ItemViewModel(itemDataModel: item2), ItemViewModel(itemDataModel: item3)]


