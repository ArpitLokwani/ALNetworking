//
//  AccountService.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 20/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import Foundation


protocol AccountServicesInterface {
    
    func getAllList(completetionHandler:completionHandlerBlk,errorHandler:errorBlock) -> Void

}