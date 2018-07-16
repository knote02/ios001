//
//  MapsViewController.swift
//  scatch-ios
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController, GoogleMapsServiceDeregate, GMSMapViewDelegate, AppLocationManagerDelegate{

    var locationManager: CLLocationManager!
    var mapView: GMSMapView!
    let googleMapsService = GoogleMapsService()
    let mapStartDispatch = DispatchGroup()
    var isInitLoad = true
    var markers:[GMSMarker] = []
    var polylines:[GMSPolyline] = []
    var myLocation:CLLocationCoordinate2D?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //AppLocationManager.sharedInstance.startUpdateLocation(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //AppLocationManager.sharedInstance.stopUpdateLocation(self)
    }
    
    override func loadView() {
        
        mapStartDispatch.enter()
        googleMapsService.delegate = self
        let camera = GMSCameraPosition.camera(withLatitude: 35.662, longitude: 139.760, zoom: 16.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        view = mapView
        
        
        mapStartDispatch.enter()
        googleMapsService.geocoding(addresses: getAddresses())
        
        //初期化が完了したらカメラ移動
        mapStartDispatch.notify(queue: .main) {
            self.moveCameraAllMarkersView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        self.view.layoutIfNeeded()
        
        let frame = CGRect(x:0,y:0,width:320,height:50)
        let rect1 = SinglePageHeader(frame:frame)
        //rect1.setTitle("aaa")
        ///rect1.translatesAutoresizingMaskIntoConstraints = false
        //rect1.backgroundColor = UIColor.orange
        
        self.view.addSubview(rect1)
        
    }
    /// deliveriesから重複を省いた住所の配列を取得
    ///
    /// - Returns: 住所配列
    func getAddresses() -> [String]{
        return ["東京都練馬区豊玉上２丁目４","東京都練馬区豊玉北３丁目２６−１１","東京都練馬区豊玉上２丁目２２−１４"]
    }
    
    func geocodingApiResult(result: [String : CLLocationCoordinate2D]) {
        for (address, location) in result {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            marker.title = address
            marker.map = self.mapView
            markers.append(marker)
        }
        mapStartDispatch.leave()
    }
    
    /// マーカーが全て表示されるようにカメラを移動
    func moveCameraAllMarkersView() {
        let bounds = markers.reduce(GMSCoordinateBounds()) {
            $0.includingCoordinate($1.position)
        }
        
        mapView.animate(with: .fit(bounds, withPadding: 30.0))
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        if(isInitLoad) {
            isInitLoad = false
            mapStartDispatch.leave()
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let location = self.myLocation else {
            return false
        }
    
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func showPath(polyStr :String){
        /*
        polyline.map = nil
        let path = GMSPath(fromEncodedPath: polyStr)
        polyline = GMSPolyline(path: path)
        polyline.title = "タイトル"
        polyline.geodesic = true
        polyline.strokeWidth = 4.0
        polyline.map = mapView // Your map view*/
    }
    
    func didUpdateLocations(_ locations: [CLLocation]) {
        self.myLocation = locations.last?.coordinate
    }
}
