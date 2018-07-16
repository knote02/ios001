//
//  GoogleMapsService.swift
//  scatch-ios
//

import GoogleMaps
import CoreLocation

/// GoogleMaps SDKに関連するサービス
class GoogleMapsService {
    
    var delegate:GoogleMapsServiceDeregate?
    private let geocodeCache = GeocodeCache()
    private let geocodeApi = GoogleMapsGeocodingApiService()
    
    init() {
    }
    
    /// Geocoding (住所 => 緯度・経度　変換)
    ///
    /// - Parameter addresses: 住所
    func geocoding(addresses: [String]) {
        
        let dispatchGroup = DispatchGroup()
        var resultDictionary = [String: CLLocationCoordinate2D]()
        
        for address in addresses {
            dispatchGroup.enter()
            if let cacheLocation = geocodeCache.get(address: address) {
                resultDictionary[address] = cacheLocation
                dispatchGroup.leave()
                continue
            }
            geocodeApi.request(address: address) { (result) in
                self.geocodeCache.set(address: address, location: result)
                resultDictionary[address] = result
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main ) {
            if Thread.current == Thread.main && self.delegate != nil {
                self.delegate?.geocodingApiResult(result: resultDictionary)
            }
        }
    }
    
    func directions (from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        
    }
}

protocol GoogleMapsServiceDeregate {
    func geocodingApiResult(result: [String:CLLocationCoordinate2D])
}
