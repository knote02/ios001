//
//  App.swift
//  scatch-ios
//
//  Created by 竹田 光佑 on 2016/07/08.
//  Copyright © 2016年 竹田 光佑. All rights reserved.
//

import Foundation

enum AppConfiguration: String {
    case debug = "Debug"
    case release = "Release"
}

class App {
    
    #if DEBUG
    static let CONFIGURATION: AppConfiguration = .debug
    #else
    static let CONFIGURATION: AppConfiguration = .release
    #endif
    
    private(set) static var SERVER: String? = {
        return App.getEnv("APP_SERVER")
    }()

    private(set) static var COMMIT_SHORT_HASH: String? = {
        return App.getEnv("APP_COMMIT_SHORT_HASH")
    }()
    
    private(set) static var SERVER_SCATCH_URL: String = {
        return App.returnEnvString(
            forDevelopment: Router.SCATCH_URL_DEVELOPMENT,
            forStaging: Router.SCATCH_URL_STAGING,
            forProduction: Router.SCATCH_URL_PRODUCTION)
    }()
    
    private(set) static var SERVER_MAP_URL: String = {
        return App.returnEnvString(
            forDevelopment: Router.MAP_URL_DEVELOPMENT,
            forStaging: Router.MAP_URL_STAGING,
            forProduction: Router.MAP_URL_PRODUCTION)
    }()
    
    private(set) static var SERVER_PUSH_URL: String = {
        return App.returnEnvString(
            forDevelopment: Router.PUSH_URL_DEVELOPMENT,
            forStaging: Router.PUSH_URL_STAGING,
            forProduction: Router.PUSH_URL_PRODUCTION)
    }()
    
    private(set) static var SERVER_IPA_URL: String = {
        return App.returnEnvString(
            forDevelopment: Router.IPA_URL_STAGING,
            forStaging: Router.IPA_URL_STAGING,
            forProduction: Router.IPA_URL_PRODUCTION)
    }()

    public static func getEnv(_ key: String) -> String? {
        // scheme : Environment Variables
        let processEnv = ProcessInfo.processInfo.environment[key]
        if processEnv?.isEmpty == false {
            return processEnv
        }
        // Info.plist
        return Bundle.main
            .object(forInfoDictionaryKey: key) as? String
    }
    
    public static func server(_ asServers: [String]) -> Bool {
        if let server = App.SERVER {
            return asServers.map({$0.lowercased()}).contains(server.lowercased())
        }
        return false
    }
    
    public static func server(_ asServer: String) -> Bool {
        if let server = App.SERVER {
            return server.lowercased() == asServer.lowercased()
        }
        return false
    }
    
    public static func returnEnvString(
        forDevelopment: String, forStaging: String, forProduction: String) -> String {
        if App.server("development") {
            return forDevelopment
        }
        if App.server("staging") {
            return forStaging
        }
        return forProduction
    }

    public static func dateFormatter(format: String) -> DateFormatter {
        let fmt = DateFormatter()
        fmt.dateFormat = format
        return fmt
    }
    
    /// Realmのデータ形式変更時にバージョンを上げる
    static let REALM_SCHEMA_VERSION: UInt64 = 23
    
    static let TIME_ZONE_ASIA_TOKYO = TimeZone(identifier: "Asia/Tokyo")
    static let JSON_DATE_FORMAT_DEFAULT = "yyyy-MM-dd HH:mm"
    static let JSON_DATE_FORMAT_INCLUDES_SECONDS = "yyyy-MM-dd HH:mm:ss"
    
    static let DATE_FORMAT_DATE = "yyyy/MM/dd"
    static let DATE_FORMAT_DATE_HYPHEN = "yyyy-MM-dd"
    static let DATE_FORMAT_DATE_JP = "yyyy年M月d日"
    static let DATE_FORMAT_DATE_HOUR_MINUTE = "yyyy/MM/dd HH:mm"
    static let DATE_FORMAT_HOUR_MINITUE = "HH:mm"
    static let DATE_FORMAT_MDHM = "MM/dd HH:mm"
    
    static let END_WORKING_TIME_DIFFERENCE_INTERVAL = 60 * 60 * 2
    
    static let GOOGLE_ANALYTICS_TRACKING_ID = "UA-62451979-2"
    
    static let PRE_ORDER_TYPE_NORMAL_ORDER = "1"
    static let PRE_ORDER_TYPE_COLLECT_ORDER = "2"

    static let EC_KEY_ID_DIGITS = 12
    static let COLLECT_ORDER_REGISTER_EC_KEY_ID = "471000"
    static let IS_NOT_REGISTERED_IN_MST_ERROR = "01"
    static let IS_USED_EC_KEY_ID_ERROR = "02"
    
    #if DEBUG
    static let GOOGLE_MAPS_API_KEY = "AIzaSyDb_tsxP_warnxf6yWKVwQwOao-KbemUfo"
    static let GOOGLE_MAPS_GEOCODING_API_KEY = "AIzaSyDb_tsxP_warnxf6yWKVwQwOao-KbemUfo"
    #else
    static let GOOGLE_MAPS_API_KEY = "AIzaSyAlr_haTGupF1OBEzAkK6CC6RNWHqpF3Eg"
    static let GOOGLE_MAPS_GEOCODING_API_KEY = "AIzaSyCBLlTZ8F81KposDt8pVJlc8J4tlCeewqo"
    #endif
}
