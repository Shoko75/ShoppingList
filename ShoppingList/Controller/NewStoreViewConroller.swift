//
//  NewStoreViewConroller.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-11-22.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit
import Firebase

class NewStoreViewConroller: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    var stores = [StoreViewModel]()
    let storeRef = Database.database().reference(withPath: "store-list")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addedStoreCell", for: indexPath) as! NewStoreCollectionViewCell
        
        cell.setLabel(store: stores[indexPath.row])
        
        return cell
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if textField.text == "" {
            print("Nothing to add")
        } else {
            let newStore = StoreViewModel(storeDataModel: StoreDataModel(storeName: textField.text!))
            stores.append(newStore)
            //storeViewModel.append(newStore)
            textField.text = ""
            collectionView.reloadData()
        }
    }
    
    @IBAction func pressedDone(_ sender: Any) {
        
        for store in stores {
            self.storeRef.childByAutoId().setValue(store.toAnyObject())
        }
        dismiss(animated: true, completion: nil)
    }
}
