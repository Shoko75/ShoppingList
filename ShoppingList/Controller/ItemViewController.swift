//
//  ItemViewController.swift
//  ShoppingList
//
//  Created by Shoko Hashimoto on 2019-11-22.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit
import Firebase

class ItemViewController: UIViewController {
    
    var store = [StoreViewModel]()
    var storeName = ""
    
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    let itemRef = Database.database().reference(withPath: "item-list")
    let storeRef = Database.database().reference(withPath: "store-list")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // pilerView delegate
        storePicker.delegate = self
        storePicker.dataSource = self
        
        retrievingData()
    }
    
    func retrievingData(){
        storeRef.observe(.value, with: { snapshot in
            if let storeData = snapshot.value as? NSDictionary {
                for(_,item) in storeData {
                    let data = item as! [String:Any]
                    self.store.append(StoreViewModel(storeDataModel: StoreDataModel(storeName:  data["storeName"] as! String)))
                }
            }
            self.storePicker.reloadAllComponents()
        })
    }
    
    @IBAction func pressedCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressedDone(_ sender: Any) {
        
        print("Pressed Done button")
        
        guard itemName.text != "" , storeName != "" else { return }
        
        let item = ItemViewModel(itemDataModel: ItemDataModel(isCompleted: false,
                                                    storeInfomation:StoreDataModel(storeName: storeName), itemTitle: itemName.text!))
        
        self.itemRef.childByAutoId().setValue(item.toAnyObject())
//        itemViewModel.append(item)
        
        dismiss(animated: true, completion: nil)
    }

}

extension ItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return store.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: storePicker.frame.size.width, height: 50))
        
        if row == 0 {
            label.text = "Pick store"
        } else {
            label.text = store[row - 1].storeName
        }
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto", size: 24)
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row != 0 {
            storeName = store[row - 1].storeName
        }
    }
}

