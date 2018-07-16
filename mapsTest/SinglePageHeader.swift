//
//  SinglePageHeader.swift
//  scatch-ios
//
//  Created by keisukeiwamoto on 2018/07/12.
//  Copyright © 2018年 keisukeiwamoto. All rights reserved.
//

import UIKit

class SinglePageHeader: UINibView {
    
    @IBOutlet weak var title: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setTitle(_ title:String) {
        self.title.text = title
    }

}
