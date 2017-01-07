//
//  ALApplicationData.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/21/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit

class ALApplicationData: NSObject {

    var configuration :ALMutableDictionary = [:]
    var configuarionFilePath:NSURL!
    
    class var sharedInstance: ALApplicationData {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ALApplicationData? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ALApplicationData()
        }
        return Static.instance!
    }
    
    
    
    
}
