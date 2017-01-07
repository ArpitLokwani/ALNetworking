//
//  ALServiceFactory.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 20/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit

class ALServiceFactory:ALNetworkServiceMock {
    
    var servicesContext:ALServicesContext? = nil
    var networkService:AnyObject? = nil
    
    func setServiceContext(context:ALServicesContext) -> Void{
        servicesContext = context
    }
    
    func servicesContextes() -> ALServicesContext {
        return servicesContext!
    }
    
    func networkServices() -> ALNetworkServiceMock {
        return  self.getServices("NetworkService")
    }
    
    func applicationServices() -> ALApplicaitonDataService {
        return ALApplicaitonDataService()
    }
    
    func getServices(serviceName:String) -> ALNetworkServiceMock {
       // return (servicesContext?.getDependencyProtocol(serviceName))!
        return ALNetworkServiceMock()
    }
}
