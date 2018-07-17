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
    @IBOutlet weak var timePanel: UIView!
    @IBOutlet weak var header: SinglePageHeader!
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
                self.timeTable.register(UINib(nibName: "TimeTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeTableViewCell")
    //timeTable.register(TimeTableViewCell.self, forCellReuseIdentifier: "TimeTableViewCell")
        timeTable.delegate = self
        timeTable.dataSource = self
        timeTable.isMultipleTouchEnabled = true
        timeTable.allowsMultipleSelection = true
        header.setTitle("配送MAP")
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        timeTable.reloadData()
        
        let label: UILabel = UILabel(frame:CGRect(x:0,y:0,width:100,height:50))
        label.text = "Label"
        label.textColor = UIColor.black
        label.shadowColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
        //label.layer.position = CGPoint(x:label.bounds.width/2,y:label.bounds.height/2)
        timePanel.addSubview(label)
        
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
            self.timePanel.center.y += 100.0
        }, completion:  {(finished: Bool) in
            self.is2 = true
        })
        } else {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.timePanel.center.y -= 100.0
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
    
    
    func tableView(_ table: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
    /*
     
     Cellに値を設定するデータソースメソッド.
     
     (実装必須)
     
     */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = timeTable.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath as IndexPath) as! TimeTableViewCell
        
        // Cellに値を設定する.
        cell.time!.text = "\(myItems[indexPath.row])"
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("AAA")
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
