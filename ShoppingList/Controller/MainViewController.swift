//
//  MainViewController.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-11-08.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit

struct CellData {
    var opened = Bool()
    var title = String()
    var sectionData = [ItemViewModel]()
}

class MainViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var mapRoundedButtonView: RoundedButton!
    
    @IBOutlet weak var allRoundedButtonView: RoundedButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewData = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let spaceView = UIView()
        spaceView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.tableFooterView = spaceView
        
        tableViewData = [CellData(opened: false, title: "London Drugs", sectionData: [itemViewModel[0], itemViewModel[1], itemViewModel[2]]), CellData(opened: false, title: "Save on Foods", sectionData: [itemViewModel[0], itemViewModel[1], itemViewModel[2]]), CellData(opened: false, title: "Safeway", sectionData: [itemViewModel[0], itemViewModel[1], itemViewModel[2]])]
        
        mapRoundedButtonView.setButton()
        allRoundedButtonView.setButton()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainPageItemCell") else {return UITableViewCell()}
            
            cell.textLabel?.text = tableViewData[indexPath.section].title
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainPageItemCell") else {return UITableViewCell()}
                       
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1].itemName
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    
}


