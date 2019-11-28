//
//  ViewController.swift
//  ShoppingList
//
//  Created by Shoko Hashimoto on 2019-10-25.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit

class ItemListViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.separatorStyle = .none
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemListTableViewCell
        
        
        // layout
        cell.itemCellView.layer.cornerRadius = 5
        cell.storeButton.layer.cornerRadius = 5
        cell.storeButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        
        // put the data
//        cell.itemLabel.text = itemViewModel[indexPath.row].itemName
//        cell.storeButton.setTitle(itemViewModel[indexPath.row].store.storeName, for:.normal)
        
        return cell
    }
    
    
    
}

