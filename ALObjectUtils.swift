//
//  ALObjectUtils.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/19/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit


class ALObjectUtils: NSObject {
    static func getObjectFrom(dictionary:NSDictionary,Key:AnyObject) -> AnyObject?
    {
        if  dictionary.count == 0  {
            return ""
        }
        let value = dictionary.objectForKey(Key)
        if  value != nil{
            return value!
        }
        return ""
    }
    
    static func getStringFrom(dictionary:NSDictionary,key:AnyObject) -> AnyObject?
    {
        if  dictionary.count == 0  {
            return ""
        }
        let value = dictionary.objectForKey(key)
        if value?.count>0 || (value?.isKindOfClass(NSString))!{
            return value!
        }
        return ""
    }
    
    func isNotNull(object:AnyObject?) -> Bool {
    guard let object = object else {
    return false
    }
        
    return (isNotNSNull(object) && isNotStringNull(object))
    }
    
    func isNotNSNull(object:AnyObject) -> Bool {
        return object.classForCoder != NSNull.classForCoder()
    }
    
    func isNotStringNull(object:AnyObject) -> Bool {
        if let object = object as? String where object.uppercaseString == "NULL" {
            return false
        }
        return true
    }
}
