//
//  TestController.swift
//  ShoppingList
//
//  Created by Lucas Rocha on 2019-11-14.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import Foundation
import ExpandableCell

class TestController: UIViewController, ExpandableDelegate {
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        return [100]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ExpandableCell
        return [cell, cell]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ExpandableCell
        return cell
        
    }
    
    override func viewDidLoad() {
        tableView.expandableDelegate = self
    }
    
    
    @IBOutlet weak var tableView: ExpandableTableView!
}
