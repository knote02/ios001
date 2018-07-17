//
//  ViewController34.swift
//  mapsTest
//
//  Created by 岩本圭祐 on 2018/07/18.
//  Copyright © 2018年 岩本圭祐. All rights reserved.
//

import UIKit

class ViewController34: UIViewController {

    @IBOutlet weak var moveView: UIView!
    @IBOutlet weak var childView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonup(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseIn ,.allowUserInteraction], animations: {
            self.moveView.center.y += 100.0
        }, completion:  {(finished: Bool) in
           // self.is2 = true
        })
    }
    
    @IBAction func afea(_ sender: Any) {
        print("AA")
    }
}
