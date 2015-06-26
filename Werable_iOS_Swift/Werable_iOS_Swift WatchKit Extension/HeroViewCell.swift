//
//  HeroViewCell.swift
//  Werable_iOS_Swift
//
//  Created by Josh Ketcham on 5/9/15.
//  Copyright (c) 2015 Full Sail. All rights reserved.
//

import UIKit

class HeroViewCell: UITableViewCell {

    @IBOutlet weak var heroImage: WKInterfaceImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
