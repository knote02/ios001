//
//  GoogleMapsDirectionsApiService.swift
//  scatch-ios
//

import Alamofire
import SwiftyJSON
import CoreLocation

class GoogleMapsDirectionsApiService {
    
    func getRoutes(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D, completion: @escaping ((String, JSON) -> Void)) {
        let baseURL = "https://maps.googleapis.com/maps/api/directions/json?language=ja&mode=driving"
        
        let requestURL = "\(baseURL)&key=\(App.GOOGLE_MAPS_GEOCODING_API_KEY)"
        let parameters = ["origin": "\(from.latitude),\(from.longitude)", "destination": "\(to.latitude),\(to.longitude)"]
        Alamofire.request(requestURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            let json = JSON(response.result.value as Any)
            let points = json["routes"][0]["overview_polyline"]["points"].string
            let steps = json["routes"][0]["legs"][0]["steps"]
            
            completion(points!, steps)
        }
    }
    
}
