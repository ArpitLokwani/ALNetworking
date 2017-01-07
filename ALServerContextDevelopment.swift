//
//  ALServerContextDevelopment.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/7/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import Foundation

//        service = "https://toiletnew.epicenterlabs.com/index.php?module=default&action=listall"


class ALServerContextDevelopment{
    
    func domain() -> String{
        //https://hybrislargetestelb-530946546.ap-southeast-1.elb.amazonaws.com/apptest/api/v1/ezone/mobileHome/pinCodeAutoSuggestions?pinCode=400
      // return "https://toiletnew.epicenterlabs.com"
        ///
        return "https://api.ezoneonline.in"
        
        
    }
    func api() -> String{
       // return "index.php"
        //return "apptest/api"
        return "rest"
        
    }
    func isAuthRequired() -> Bool{
        return true
    }
    func isOAuthRequired() -> Bool{
        return true
    }
    
    func basicAuth() ->String
    {
        return ""
    }
    //    func urlCrendentials() -> NSURLCredential
    //    {
    //        var crendentials = NSURLCredential.
    //        return ""
    //    }
    //
    //    func protectionSpace() -> NSURLProtectionSpace
    //    {
    //
    //    }
    
    func bannerBaseURL() -> String{
        return ""
    }
    
    func categoryBaseURL () -> String{
        return ""
        
    }
    
    func oAuthClientID() -> String{
        return ""
    }
    
    func oAuthClientSecret() -> String{
        return ""
        
    }
    
    func timeOut() -> NSInteger{
        return 30
    }
    
    
}
