//
//  ALPostDataEncoder.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 21/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit


extension String {
    var length: Int {
        return (self as NSString).length
    }
}

class ALPostDataEncoder: NSObject {
    
    func encodeHttpBody(httpBody:AnyObject) -> NSData {
        var dataObject:NSData? = nil
        if httpBody.count<0{
           print("postbody is null")
        }
        var postStringArray:NSMutableArray!
        if httpBody.isKindOfClass(ALDictionary) {
            let temp:ALDictionary = httpBody as! ALDictionary
            for (key,value) in temp {
                postStringArray .addObject("\(key)=\(value)")
            }
        }else if httpBody.isKindOfClass(ALArray){
            let temp:ALDictionary = httpBody as! ALDictionary
            for (key,value) in temp {
                postStringArray .addObject("\(key)=\(value)")
            }
        }
        
        if postStringArray.count>0 {
           
            let postStrin = postStringArray.componentsJoinedByString("&")
            dataObject = NSData(bytes: Array(postStrin.utf8), length:postStrin.length)
            return NSData(bytes: Array(postStrin.utf8), length:postStrin.length)
        }
        return dataObject!
    }
}

