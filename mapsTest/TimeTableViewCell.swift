//
//  TimeTableViewCell.swift
//  mapsTest
//
//  Created by 岩本圭祐 on 2018/07/16.
//  Copyright © 2018年 岩本圭祐. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
