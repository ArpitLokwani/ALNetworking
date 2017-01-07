//
//  ALNetworkService.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 18/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import Foundation



protocol ALNetworkService {
    
    func setServerContext(context:ALServerContext) -> Void
    func serversContext()->ALServerContext
    func setOperationDispatchQueue(queue:dispatch_queue_t)->Void
    func getConfigurations() -> ALDictionary
    func setConfigurationValueForKey(value:ALString,key:ALString) -> Void
    func getConfigurationValueForKey(key:ALString) -> ALString
    func clearConfigurations()-> Void
    func removeConfigurationsValueForKey(key:ALString)
    func isAuthRequired() -> Bool
    
   func getServiceRequest(service:ALString, isIncludeAPIRoot:ALBool,postParams:ALDictionary, isAsyncRequest:ALBool,isTokenRequired:ALBool,isCancelRequired:ALBool,isReloadRequired:ALBool,completetionHandler:(success:ALBool,data:NSData,response:AnyObject)-> Void,faultHndler :(faultCode:Int,faultDetails:String,data:NSData)->Void,errorHandler:errorBlock)-> Void

    
   func postServiceRequest(service:ALString, isIncludeAPIRoot:ALBool,postParams:ALDictionary, isAsyncRequest:ALBool,isTokenRequired:ALBool,isCancelRequired:ALBool,isReloadRequired:ALBool,completetionHandler:(success:ALBool,data:NSData,response:AnyObject)-> Void,faultHndler :(faultCode:Int,faultDetails:String,data:NSData)->Void,errorHandler:errorBlock)-> Void    
    
    
    
    
    
}