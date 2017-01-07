//
//  ALApplicaitonDataService.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/21/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit

struct MyClassConstants{
    static let testStr = "test"
    
    static let arrayOfTests: [String] = ["foo", "bar", testStr]
}

class ALApplicaitonDataService: ALApplicationService {
    
    
    var model:ALApplicationData? = ALApplicationData.sharedInstance
    
    class var sharedInstance: ALApplicaitonDataService {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ALApplicaitonDataService? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ALApplicaitonDataService()
        }
        return Static.instance!
    }

    func loadConfiguration(completionHandler: (succes: Bool) -> Void) throws {
        if (model!.configuarionFilePath != nil) {
            var  configurations  = ALMutableDictionary(contentsOfURL: model!.configuarionFilePath)
            model?.configuration = ALMutableDictionary()
            
            if configurations!.count>0 {
                model?.configuration = configurations!
                try! self.saveConfiguration()
                completionHandler(succes: true)
            }else{
                completionHandler(succes: false)
            }
        }
        else{
            completionHandler(succes: false)
        }
    }
    
    func addSkipBackupAttributeToItemAtURL(url: NSURL) throws
    {
        assert(NSFileManager.defaultManager().fileExistsAtPath(url.path!))
        try url.setResourceValue(true, forKey: NSURLIsExcludedFromBackupKey)
    }
    
    
    func saveConfiguration() throws{
        model?.configuration.writeToURL(model!.configuarionFilePath!, atomically: true)
       try self.addSkipBackupAttributeToItemAtURL(model!.configuarionFilePath!)
        
    }
    
    func getConfigurationValueForKey(key: AnyObject) -> AnyObject {
        if ALObjectUtils.getObjectFrom((model?.configuration)!, Key: key )!.length>0{
            return ALObjectUtils.getObjectFrom((model?.configuration)!, Key: key )!
        }else
        {
            return ""
        }
    }

    func getConfigurations() -> NSMutableDictionary {
        return (model?.configuration)!
    }
    func removeConfigurationValueForKey(key: AnyObject) -> Void{
        return (model?.configuration .removeObjectForKey(key ))!
    }

    func clearConfiguration() {
        model?.configuration.removeAllObjects()
    }
    func setConfiguration(value: AnyObject, forKey key: AnyObject) ->Void {
//        if value.count>0 && key.count>0{
            model?.configuration.setValue(value, forKey: key as! String)
            
//        }
    }
}
