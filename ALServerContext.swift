//
//  ALServerContext.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/6/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import Foundation


protocol ALServerContext{

    func domain() -> ALString
    func api() -> ALString
    func isAuthRequired() -> ALBool
    func isOAuthRequired() -> ALBool
    func basicAuth() ->ALString
    func urlCrendentials() -> ALNSURLCredential
    func protectionSpace() -> NSURLProtectionSpace
    func bannerBaseURL() -> ALString
    func categoryBaseURL () -> ALString
    func oAuthClientID() -> ALString
    func oAuthClientSecret() -> ALString
    func timeOut() -> ALInteger
    
}