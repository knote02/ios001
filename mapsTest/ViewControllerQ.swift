//
//  ViewControllerM.swift
//  mapsTest
//
//  Created by 岩本圭祐 on 2018/07/14.
//  Copyright © 2018年 岩本圭祐. All rights reserved.
//

import UIKit
import GoogleMaps
import Spring

class ViewControllerQ: UIViewController{
private let myItems: NSArray = ["TEST1", "TEST2", "TEST3"]
    @IBOutlet weak var timePanel: UIView!
    @IBOutlet weak var mapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //mapView.isMyLocationEnabled = true
        //mapView.settings.myLocationButton = true
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    var is2:Bool = false
    @IBAction func openTimePanel(_ sender: Any) {
       // self.view.bringSubview(toFront: timePanel)
        if(!is2) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseIn ,.allowUserInteraction], animations: {
            self.timePanel.center.y += 200.0
        }, completion:  {(finished: Bool) in
            self.is2 = true
        })
        } else {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.timePanel.center.y -= 200.0
            }, completion:  {(finished: Bool) in
                self.is2 = false
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
