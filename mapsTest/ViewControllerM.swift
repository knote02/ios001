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

class ViewControllerM: UIViewController, UITableViewDelegate, UITableViewDataSource {
private let myItems: NSArray = ["TEST1", "TEST2", "TEST3"]
    @IBOutlet weak var timeTable: UITableView!
    @IBOutlet weak var timePanel: SpringView!
    @IBOutlet weak var header: SinglePageHeader!
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeTable.register(TimeTableViewCell.self, forCellReuseIdentifier: "TimeTableViewCell")
        timeTable.delegate = self
        timeTable.dataSource = self
        header.setTitle("配送MAP")
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        timeTable.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func openTimePanel(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.timePanel.center.y += 100.0
        }, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    /*
     
     Cellの総数を返すデータソースメソッド.
     
     (実装必須)
     
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myItems.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    /*
     
     Cellに値を設定するデータソースメソッド.
     
     (実装必須)
     
     */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        
        let cell = timeTable.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath as IndexPath) as! TimeTableViewCell
        
        // Cellに値を設定する.
        
        //cell.time!.text = "\(myItems[indexPath.row])"
        
        
        
        return cell
        
    }
    
    
}
