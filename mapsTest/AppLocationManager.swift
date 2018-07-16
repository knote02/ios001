//
//  AppLocationManager.swift
//  scatch-ios
//

import CoreLocation

final class AppLocationManager: NSObject {
    static let sharedInstance = AppLocationManager()
    
    var locationManager: CLLocationManager?
    weak var delegate:AppLocationManagerDelegate?
    
    var delegateTable = NSHashTable<AnyObject>.weakObjects()
    
    fileprivate override init (){
        super.init()
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self;
        if #available(iOS 9.0, *) {
            locationManager?.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        }
        self.locationManager?.pausesLocationUpdatesAutomatically = false
        addObserver()
    }
    
    deinit {
        removeObserver()
    }
    
    func addObserver() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(checkLocationService(_:)),
            name:NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(
            self, name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    @objc func checkLocationService(_ sender: AnyObject? = nil){
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            self.locationManager?.requestAlwaysAuthorization()
            return
        case .denied, .restricted, .authorizedWhenInUse:
            if CLLocationManager.locationServicesEnabled() {
                showEnableAppSettingsAlert()
                return
            }
        default:
            break
        }
        
        if CLLocationManager.locationServicesEnabled() == false {
            showEnableLocationServicesAlert()
            return
        }
    }
    
    func startUpdateLocation(_ object:AnyObject) {
        delegateTable.add(object)
        self.locationManager?.startUpdatingLocation()
    }
    
    func stopUpdateLocation(_ object:AnyObject) {
        delegateTable.remove(object)
        if delegateTable.count > 0 { //他のオブジェクトが使用していたら停止させない
            return
        }
        self.locationManager?.stopUpdatingLocation();
    }
    
    func showEnableLocationServicesAlert() {

    }
    
    func showEnableAppSettingsAlert() {

    }
    
}

extension AppLocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if(delegateTable.count == 0 || locations.count == 0) {
            return
        }
        for case let target as AppLocationManagerDelegate in self.delegateTable.allObjects {
            target.didUpdateLocations(locations)
        }
    }
}

protocol AppLocationManagerDelegate: class {
    func didUpdateLocations(_ locations: [CLLocation])
}

