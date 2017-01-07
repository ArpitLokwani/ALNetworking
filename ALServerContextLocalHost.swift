//
//  ALServerContextLocalHost.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 18/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit

class ALServerContextLocalHost: ALServerContext {

    func domain() -> ALString {
           return "https://hybrislargetestelb-35149713.ap-southeast-1.elb.amazonaws.com/ezone"; // This is for time being
    }
    
    func api() -> ALString  {
        return "/futuregroup/api";
    }
    
    func isAuthRequired() -> ALBool{
        return true;
    }
    
    func isOAuthRequired() -> ALBool{
        return true;
    }
    
    func basicAuth() ->ALString{
        return ""
    }
    
    func urlCrendentials() -> ALNSURLCredential{
       
        let creds = NSURLCredential(user: "service.admin@goldrush.com", password: "Serv1c3Inf0Ax0n", persistence: NSURLCredentialPersistence.None)
        return creds;
    }
    
    func protectionSpace() -> NSURLProtectionSpace{
       
        let protectionSpace = NSURLProtectionSpace(host: "193.180.106.19", port: 80, protocol: "http", realm: "193.180.106.19", authenticationMethod: NSURLAuthenticationMethodNTLM)
        return protectionSpace;
    }
    
    func bannerBaseURL() -> ALString{
        return ""
    }
    
    func categoryBaseURL () -> ALString{
        return ""

    }
    
    func oAuthClientID() -> ALString{
        return ""
    }
    
    func oAuthClientSecret() -> ALString{
        return ""
    }
    
    func timeOut() -> ALInteger{
        return 30
    }
    
}
