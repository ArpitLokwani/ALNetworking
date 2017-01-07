//
//  ALApplicaitonService.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/21/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import Foundation

protocol ALApplicationService{
    
    func setConfiguration(value:AnyObject, forKey key:AnyObject) -> Void
    func getConfigurationValueForKey(key :AnyObject) -> AnyObject
    func getConfigurations() -> NSMutableDictionary
    func removeConfigurationValueForKey (key : AnyObject) -> Void
    func clearConfiguration()
    func saveConfiguration() throws
    func loadConfiguration(completionHandler: (succes: Bool) -> Void) throws
    func addSkipBackupAttributeToItemAtURL(url: NSURL) throws
    
}
