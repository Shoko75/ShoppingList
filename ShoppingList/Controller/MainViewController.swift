//
//  MainViewController.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-11-08.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var mapRoundedButtonView: RoundedButton!
    
    @IBOutlet weak var allRoundedButtonView: RoundedButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataDict = [String:CellData]()
    let itemRef = Database.database().reference(withPath: "item-list")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Layout
        let spaceView = UIView()
        spaceView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.tableFooterView = spaceView
        mapRoundedButtonView.setButton()
        allRoundedButtonView.setButton()
        
        // Data
        retrievingData()
        
    }
    
    func retrievingData() {
        
        itemRef.observe(.value, with: { snapshot in
            self.dataDict.removeAll()
            if let itemData = snapshot.value as? NSDictionary {
                for (_,item) in itemData {
                    let data = item as! [String: Any]
                    let storeName = data["storeInfomation"] as! String
                    if self.dataDict[storeName] != nil {
                        self.dataDict[storeName]!.itemData.append(ItemViewModel(itemDataModel: ItemDataModel(isCompleted: data["isCompleted"] as! Bool, storeInfomation: StoreDataModel(storeName: data["storeInfomation"] as! String) , itemTitle: data["itemTitle"] as! String)))
                    } else {
                        self.dataDict[storeName] = CellData(opened: false, itemData: [ItemViewModel(itemDataModel: ItemDataModel(isCompleted: data["isCompleted"] as! Bool, storeInfomation: StoreDataModel(storeName: data["storeInfomation"] as! String) , itemTitle: data["itemTitle"] as! String))])
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let keys = Array(dataDict.keys)
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(dataDict.keys)[section]
        
        if dataDict[key]?.opened == true {
            return dataDict[key]!.itemData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let key = Array(dataDict.keys)[indexPath.section]
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainPageItemCell") else {return UITableViewCell()}
            
            cell.textLabel?.text = key
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainPageItemCell") else {return UITableViewCell()}
            
            cell.textLabel?.text = dataDict[key]?.itemData[indexPath.row - 1].itemName
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = Array(dataDict.keys)[indexPath.section]
        if indexPath.row == 0 {
            if dataDict[key]!.opened == true {
                dataDict[key]!.opened = false
                
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                dataDict[key]?.opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
            }
            
        }
        
    }
    
}


