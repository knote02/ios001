//
//  ViewController.swift
//  mapsTest
//
//  Created by 岩本圭祐 on 2018/07/14.
//  Copyright © 2018年 岩本圭祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //self.present(MapsViewController(), animated: true, completion: nil)
        //self.present(ViewControllerM(), animated: true, completion: nil)
        self.present(ViewControllerM(), animated: true, completion: nil)
    }
}

