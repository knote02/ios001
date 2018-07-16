//
//  Router.swift
//  scatch-ios
//
//  Created by 竹田光佑 on 2016/04/15.
//  Copyright © 2016年 竹田光佑. All rights reserved.
//

import Foundation

class Router {
    static let SCATCH_URL_DEVELOPMENT = "http://scatch-syu:8501/syu/services"
    static let SCATCH_URL_STAGING =     "https://st.scatch.jp/syu/services"
    static let SCATCH_URL_PRODUCTION =  "https://scatch.jp/syu/services"
    
    static let MAP_URL_DEVELOPMENT = "https://st.scatch.jp/map/api/v1" //staging
    static let MAP_URL_STAGING =     "https://st.scatch.jp/map/api/v1"
    static let MAP_URL_PRODUCTION =  "https://scatch.jp/map/api/v1"

    static let PUSH_URL_DEVELOPMENT = "https://st.scatch.jp/spn/api"  //staging
    static let PUSH_URL_STAGING =     "https://st.scatch.jp/spn/api"
    static let PUSH_URL_PRODUCTION =  "https://scatch.jp/spn/api"
    
    static let IPA_URL_STAGING = "https://s3-ap-northeast-1.amazonaws.com/scatch/sandbox/index.html"
    static let IPA_URL_PRODUCTION = "https://s3-ap-northeast-1.amazonaws.com/scatch/index.html"
    
    static let MANUAL_DRIVER_URL = "https://s3-ap-northeast-1.amazonaws.com/scatch-manual/driver/pdf/driver_manual.pdf"
    static let MANUAL_DEPO = "https://s3-ap-northeast-1.amazonaws.com/scatch-manual/driver/pdf/driver_depo_manual.pdf"
    static let MANUAL_COLLECT = "https://s3-ap-northeast-1.amazonaws.com/scatch-manual/driver/pdf/driver_collect_manual.pdf"
    static let MANUAL_NG = "https://s3-ap-northeast-1.amazonaws.com/scatch-manual/driver/pdf/driver_ng_manual.pdf"
    
    static let INQUIRY_URL = "https://s3-ap-northeast-1.amazonaws.com/scatch/driver/inquiry.html"
    
    static let GOOGLE_MAPS_API = "https://maps.googleapis.com/maps/api"
    
    static let mapBaseURL = App.SERVER_MAP_URL
    static let scatchBaseURL = App.SERVER_SCATCH_URL
    static let pushBaseURL = App.SERVER_PUSH_URL
    
    static let DRIVER_LOGIN_DRIVER_API = scatchBaseURL + "/driver/loginDriver/"
    static let DRIVER_GET_LOGIN_DRIVER_API = scatchBaseURL + "/driver/getLoginDriver/"
    static let DRIVER_GET_DRIVER_INFO_API = scatchBaseURL + "/driver/getDriverInfo/"
    static let DRIVER_GET_DELIVERY_LIST_API = scatchBaseURL + "/driver/getDeliveryList/"
    static let DRIVER_GET_COLLECT_LIST_TODAY_API = scatchBaseURL + "/driver/getCollectListToday/"
    static let DRIVER_GET_DRIVER_REVIEW_API = scatchBaseURL + "/driver/getDriverReview/"
    static let DRIVER_GET_CUSTOMER_REVIEW_API = scatchBaseURL + "/driver/getCustomerReview/"
    static let DRIVER_GET_UN_CAGED_DELIVERY_LIST_API = scatchBaseURL + "/driver/getUncagedDeliveryList/"
    static let DRIVER_GET_DRIVER_STATUS_API = scatchBaseURL + "/driver/getDriverStatus/"
    static let DRIVER_UPDATE_ORDER_DELIVERY_API = scatchBaseURL + "/driver/updateOrderDelivery/"
    static let DRIVER_UPDATE_ORDER_DELIVERY_LIST_API = scatchBaseURL + "/driver/updateOrderDeliveryList/"
    static let DRIVER_UPDATE_PREORDER_DELIVERY_LIST_API = scatchBaseURL + "/driver/updatePreOrderDeliveryList/"
    static let DRIVER_UPDATE_COLLECT_STATUS_LIST_API = scatchBaseURL + "/driver/updateCollectStatusList/"
    static let DRIVER_UPDATE_RETURN_STATUS_LIST_API = scatchBaseURL + "/driver/updateReturnStatusList/"
    static let DRIVER_UPDATE_CAGE_STATUS_API = scatchBaseURL + "/driver/updateCageStatus/"
    static let DRIVER_NOTES_API = scatchBaseURL + "/driver/notes/"
    static let DRIVER_NOTE_CREATE_OR_UPDATE_API = scatchBaseURL + "/driver/note/createOrUpdate/"
    static let DRIVER_REGISTER_ORDER_LIST_API = scatchBaseURL + "/driver/registerOrderList/"
    static let DRIVER_DELETE_ORDER_LIST_API = scatchBaseURL + "/driver/deleteOrderList/"
    
    static let DRIVER_UPLOAD_SIGNATURE_API = scatchBaseURL + "/driver/uploadSignature/"
    static let DRIVER_UPLOAD_LUGGAGE_PLACE_API = scatchBaseURL + "/driver/uploadLuggagePlace/"
    
    static let MAP_LOCATIONS_API = mapBaseURL + "/locations/"
    static let MAP_LOCATIONS_LISTS_API = mapBaseURL + "/locations_lists/"
    static let MAP_CHECK_VERSION_API = mapBaseURL + "/check_version/"
    static let MAP_START_API = mapBaseURL + "/start/"
    static let MAP_END_API = mapBaseURL + "/end/"
    
    //push
    static let GET_NOTIFICATION_LIST_API = pushBaseURL + "/getNotificationList";
    static let GET_NOTIFICATION_DETAIL_API = pushBaseURL + "/getNotificationDetail";
    static let UPDATE_DRIVER_TOKEN_API = pushBaseURL + "/updateDriverToken";
}
