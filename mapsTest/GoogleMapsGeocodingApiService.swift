//
//  GoogleMapsGeocodingApiService.swift
//  scatch-ios
//

import Alamofire
import SwiftyJSON
import CoreLocation

/// Geocoding API
class GoogleMapsGeocodingApiService {
    
    func getRequestURL() -> String{
        return "\(Router.GOOGLE_MAPS_API)/geocode/json?language=ja&key=\(App.GOOGLE_MAPS_GEOCODING_API_KEY)"
    }
    
    /// APIリクエスト 実行
    ///
    /// - Parameters:
    ///   - address: 住所
    ///   - completion: コールバック　API通信が失敗した場合呼び出されない
    func request(address: String, completion: @escaping ((CLLocationCoordinate2D) -> Void)) {
        
        Alamofire.request(getRequestURL(), method: .get, parameters: ["address": address], encoding: URLEncoding.default, headers: nil).responseJSON { response in
            let json = JSON(response.result.value as Any)
            
            guard let latitude = json["results"][0]["geometry"]["location"]["lat"].double else {
                return
            }
            
            guard let longitude = json["results"][0]["geometry"]["location"]["lng"].double else {
                return
            }
            let location = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)

            completion(location)
        }
    }
}

