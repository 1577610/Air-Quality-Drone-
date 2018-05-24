//
//  ProductCommunicationManager.swift
//  AirQualityDrone
//
//  Created by Julian Riegger on 20.03.18.
//  Copyright © 2018 DHBW_Stuttgart. All rights reserved.
//

import DJISDK

class ProductCommunicationManager: NSObject {
    
    static let sharedProductCommunicationManager = ProductCommunicationManager()
    
    override
    private init() {}
    
    func registerWithSDK() {
        let appKey = Bundle.main.object(forInfoDictionaryKey: SDK_APP_KEY_INFO_PLIST_KEY) as? String
        
        guard appKey != nil && appKey!.isEmpty == false else {
            NSLog("Please enter your app key in the info.plist")
            return
        }
        
        DJISDKManager.registerApp(with: self)
    }
    
    func connectToDrone() {
        DJISDKManager.startConnectionToProduct()
    }
    
    func disconnectToDrone() {
        DJISDKManager.stopConnectionToProduct()
    }
}


extension ProductCommunicationManager : DJISDKManagerDelegate {
    func appRegisteredWithError(_ error: Error?) {
        NSLog("SDK Registered with Error \(error?.localizedDescription)")

        DJISDKManager.startConnectionToProduct()
    }
    
    func productDisconnected() {

    }
    
    func productConnected(_ product: DJIBaseProduct?) {

    }
    
    func componentConnected(withKey key: String?, andIndex index: Int) {
        
    }
    
    func componentDisconnected(withKey key: String?, andIndex index: Int) {
        
    }
}
