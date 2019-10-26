//
//  ItemListTableViewCell.swift
//  ShoppingList
//
//  Created by Shoko Hashimoto on 2019-10-25.
//  Copyright © 2019 Shoko Hashimoto. All rights reserved.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {

    @IBOutlet weak var itemCellView: UIView!
    @IBOutlet weak var checkMarkButton: UIButton!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var storeButtonWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressedStoreButton(_ sender: Any) {
        
        if storeButtonWidth.constant == 0 {
            storeButtonWidth.constant = 100
            storeButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            storeButtonWidth.constant = 0
            storeButton.setTitleColor(UIColor.clear, for: .normal)
        }
    }
    
    @IBAction func pressedCheckMark(_ sender: Any) {
        
        if checkMarkButton.titleLabel?.text == "○" {
            checkMarkButton.setTitle("●", for: .normal)
        } else {
            checkMarkButton.setTitle("○", for: .normal)
        }
        
    }
    
}

extension NSLayoutConstraint {
    func constrainWithMultiplier(_ multiplier:CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}
