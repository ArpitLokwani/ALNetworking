//
//  AccountServices.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 20/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit


class AccountServices: NSObject,AccountServicesInterface {

    var netwokService : AnyObject? = nil
    var servicefact = ALServiceFactory()
    var remoteServiceFact = ALRemoteServiceFactory()
    var postParams :[String:String] = [
        "" : "",
//        "action" : "listall"
    ]
//    var postParams :  [String:String] = [
//        "pinCode":"400"
//    
//    ]
    
    let error:NSError? = nil
    func getAllList(completetionHandler:completionHandlerBlk,errorHandler:errorBlock) -> Void
    {
        let value = NSString(format: "%@",remoteServiceFact.bannerService())
        let services:NSString
        if value.length>0 {
            services = value
        }else{
            services = ""
        }
       
        servicefact.networkServices().getServiceRequest(services as ALString, isIncludeAPIRoot: true, postParams: postParams, isAsyncRequest: true, isTokenRequired: false, isCancelRequired: false, isReloadRequired: false, completetionHandler: { (success, data, response) in
            if success{
            completetionHandler(success: success, data:data,response:response)
            }},faultHndler: { (faultCode, faultDetails, data) in
                print(faultDetails)
            }){ (error) in
                errorHandler!(error: (error as Any) as! NSError)
        }}
    
    func getBanners(completetionHandler:completionHandlerBlk,errorHandler:errorBlock) -> Void {
        
        let bannerService = NSString(format: "%@",remoteServiceFact.bannerService())
        servicefact.networkServices().getServiceRequest(bannerService as ALString, isIncludeAPIRoot: true, postParams: postParams, isAsyncRequest: true, isTokenRequired: false, isCancelRequired: false, isReloadRequired: false, completetionHandler: { (success, data,response) in
            if success{
                completetionHandler(success: success, data:data,response:response)
            }
            }, faultHndler: { (faultCode, faultDetails, data) in
            }
        ){ (error) in
            errorHandler!(error: (error as Any) as! NSError)
        }
    }
    
    func getCart(completetionHandler:completionHandlerBlk,errorHandler:errorBlock)  -> Void {
    
        let cartService = NSString(format: "%@",remoteServiceFact.cartServices())
        servicefact.networkServices().getServiceRequest(cartService as ALString, isIncludeAPIRoot: true, postParams: postParams, isAsyncRequest: true, isTokenRequired: false, isCancelRequired: false, isReloadRequired: false, completetionHandler: { (success, data,response) in
        if success{
            completetionHandler(success: success, data:data,response:response)
    }}, faultHndler: { (faultCode, faultDetails, data) in
        print(faultDetails)
    }){ (error) in
        errorHandler!(error: (error as Any) as! NSError)
        }
    }
    
    func addToCart(postParams:ALDictionary,completionHandler:completionHandlerBlk,errorHandler:errorBlock) -> Void    {
        
        let addToCartService = NSString(format: "%@",remoteServiceFact.addToCart())
        servicefact.networkServices().postServiceRequest(addToCartService as ALString, isIncludeAPIRoot: true, postParams: postParams, isAsyncRequest: true, isTokenRequired: false, isCancelRequired: false, isReloadRequired: false, completetionHandler: { (success, data, response) in
            if success {
            completionHandler(success: success, data: data, response: response)
        }}, faultHndler: { (faultCode, faultDetails, data) in
                print(faultDetails)
            }){ (error) in
                errorHandler!(error: (error as Any) as! NSError)
        }
    }
    
    func setServiceabilityArea(postParams:ALDictionary,completionHandler:completionHandlerBlk,errorHandler:errorBlock) -> Void {
        
        
        let setPincodeService = NSString(format: "%@",remoteServiceFact.setPincodeServiceability())
        
        servicefact.networkServices().postServiceRequest(setPincodeService as ALString, isIncludeAPIRoot: true, postParams: postParams, isAsyncRequest: true, isTokenRequired: false, isCancelRequired: false, isReloadRequired: true, completetionHandler: { (success, data, response) in
            if success{
                completionHandler(success: success, data: data, response: response)
                
            } }, faultHndler: { (faultCode, faultDetails, data) in
                print(faultDetails)

            }) {
                (error) in
                errorHandler!(error: (error as Any) as! NSError)

                
        }
        
    }
    
}
