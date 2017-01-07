//
//  ALServerContextFactory.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/7/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import Foundation

//var delegate:SampleProtocol?
//+(id<ServerContext>)development;
/*
 +(id<ServerContext>)localHost;
 +(id<ServerContext>)development;
 +(id<ServerContext>)stageInternal;
 +(id<ServerContext>)production;
 +(id<ServerContext>)stageExternal;
 */

class ALServerContextFactory: NSObject{

    func localHost() -> ALServerContext{
        return ALServerContextLocalHost()
    }
    
    func production() -> ALServerContext {
        return ALServerContextProduction()
    }
   
}
