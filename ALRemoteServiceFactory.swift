//
//  ALRemoteServiceFactory.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 19/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit

class ALRemoteServiceFactory: NSObject {
    
    func registrationService() -> String {
        return "/v1/ezone/mobileHome/pinCodeAutoSuggestions";
    }
    
    func bannerService() -> String{
        return "/v1/ezone/oauth/token"
    }
    
    func cartServices() -> String{
        return "/v1/ezone/cart"
    }

    func addToCart() -> String {
        return "/v1/ezone/cart/multipleEntry"
    }
    
    func ToiWikiServices() -> String {
        return""
        
    }
    ///ezone/mobileHome/setServiceabilityArea
    
    func setPincodeServiceability() -> String {
        return "/oauth/token"
        
    }
 
    
}
