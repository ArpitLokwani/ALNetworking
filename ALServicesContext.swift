//
//  ALServicesContext.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 20/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit

class ALServicesContext: NSObject {
    
    var classDictionary:NSMutableDictionary?
    var objectDictionary:NSMutableDictionary?
    
     override init() {
        
        let path = NSBundle.mainBundle().pathForResource("ALServices", ofType: "plist")
        classDictionary = NSMutableDictionary.init(contentsOfFile: path!)
        objectDictionary = NSMutableDictionary.init(capacity: classDictionary!.count)
   }

    
    func getDependencyProtocol<instancetype:ALNetworkService>(protocolName:String) -> instancetype
        
    {
        let dep:AnyObject = ALObjectUtils.getObjectFrom(objectDictionary!, Key: protocolName )!
        
        let className:AnyObject? = nil
        
        if dep.count<0{
            
            let className = ALObjectUtils.getStringFrom(classDictionary!, key: protocolName )
            objectDictionary?.setValue(className, forKey: protocolName)
            return className! as! instancetype
        
        }
        return className! as! instancetype
        
    }
    
    func getBundle() -> NSBundle {
        return NSBundle.mainBundle()
        
    }
    
    

}
