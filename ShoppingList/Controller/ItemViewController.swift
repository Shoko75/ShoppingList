//
//  ItemViewController.swift
//  ShoppingList
//
//  Created by Shoko Hashimoto on 2019-11-22.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    var store = ["StoreA","StoreB","StoreC","StoreD","StoreE"]

    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // pilerView delegate
        storePicker.delegate = self
        storePicker.dataSource = self
    }
    
    @IBAction func pressedCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressedDone(_ sender: Any) {
        
        print("Pressed Done button")
        
        guard itemName.text != "" else { return }
        
        let item = ItemViewModel(itemDataModel: ItemDataModel(isCompleted: false, storeInfomation:StoreDataModel(storeName: "\(storePicker.selectedRow(inComponent: 0))"), itemTitle: itemName.text!))
        itemViewModel.append(item)
        
        dismiss(animated: true, completion: nil)
    }

}

extension ItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return store.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: storePicker.frame.size.width, height: 50))
        label.text = store[row]
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto", size: 24)
        return label
    }
}

