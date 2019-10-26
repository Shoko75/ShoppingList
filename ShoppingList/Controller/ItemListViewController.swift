//
//  ViewController.swift
//  ShoppingList
//
//  Created by Shoko Hashimoto on 2019-10-25.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit

class ItemListViewController: UITableViewController {

    private var item = Item()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.separatorStyle = .none
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.itemTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemListTableViewCell
        
        
        // layout
        cell.itemCellView.layer.cornerRadius = 5
        cell.storeButton.layer.cornerRadius = 5
        cell.storeButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        
        // put the data
        cell.itemLabel.text = item.itemTitle[indexPath.row]
        cell.storeButton.setTitle(item.storeInfomation.storeName, for:.normal)
        
        return cell
    }
    
}

