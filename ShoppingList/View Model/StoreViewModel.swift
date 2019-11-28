//
//  StoreViewModel.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-10-29.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import Foundation

class StoreViewModel {
    
    private let storeDataModel: StoreDataModel
    
    
    init(storeDataModel: StoreDataModel) {
        self.storeDataModel = storeDataModel
    }
    
    public var storeName: String {
        return storeDataModel.storeName
    }
    
    func toAnyObject() -> Any {
      return [
        "storeName": storeName
      ]
    }
    
}

//var storeViewModel = [StoreViewModel]()
