//
//  SpecialsTableViewCell.swift
//  shopping_ios
//
//  Created by shenpengfei on 15/10/3.
//  Copyright (c) 2015年 malls. All rights reserved.
//

import UIKit

class SpecialsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var brandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
