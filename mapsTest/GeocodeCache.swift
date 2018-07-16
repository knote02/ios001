//
//  GeocodeCache.swift
//  scatch-ios
//

import CoreLocation
import RealmSwift

/// Geocodeの結果を保存
class GeocodeCache {
    
    private let realm:Realm
    
    init() {
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let path = paths[0] + "/geocode.realm"
        let url = NSURL(fileURLWithPath: path)
        realm = try! Realm(fileURL: url as URL)
    }
    
    /// データ保存
    ///
    /// - Parameters:
    ///   - address: 住所
    ///   - location: 緯度・経度
    func set(address:String, location:CLLocationCoordinate2D) {
        if get(address: address) != nil {
            return
        }
        let objects = realm.objects(GeocodeCacheObject.self)
        if objects.count > 100 {
            remove((objects.sorted(byKeyPath: "create_date", ascending: true).first)!)
        }
        try! realm.write {
            realm.add(GeocodeCacheObject(value: [address, location.latitude, location.longitude]))
        }
    }
    
    /// 引数の住所を元に緯度、経度を返す。保存されていない場合はnilを返す
    ///
    /// - Parameter address: 住所
    /// - Returns: 緯度・経度
    func get(address: String) -> CLLocationCoordinate2D? {
        let objects = realm.objects(GeocodeCacheObject.self).filter(
            "address = '"+address+"'")
        if(objects.count == 0) {
            return nil
        }
        
        if ((objects.first?.create_date)! < Date(timeIntervalSinceNow: -60*60*24*7*26) ) {//半年で有効期限切れとする
            remove(objects.first!)
            return nil
        }
        
        return CLLocationCoordinate2D.init(latitude:
            (objects.first?.latitude)!, longitude:
            (objects.first?.longitude)!)
    }
    
    /// データ削除
    ///
    /// - Parameter object: GeocodeCacheObject
    private func remove(_ object: GeocodeCacheObject) {
        try! realm.write {
            realm.delete(object)
        }
    }
}

class GeocodeCacheObject:Object {
    @objc dynamic var address = ""
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    @objc dynamic var create_date = Date()
}
