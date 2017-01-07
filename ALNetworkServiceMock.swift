//
//  ALNetworkServiceMock.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/16/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit
import Foundation
import ObjectiveC

class ALNetworkServiceMock:ALNetworkService {

    var serverContext: ALServerContext!
    var _operationDispatchQue:dispatch_queue_t?
    let cookies : NSMutableDictionary! = nil
    var authEncoded:ALString!
    var oAuthEncoded:ALString!
    var activeConnections:NSMutableArray!
    let operationQueue:NSOperationQueue! = nil
    
    
    func configureRequest(request:NSMutableURLRequest,isTokenRequired:Bool,completetionHandler: (request:NSMutableURLRequest)->Void) -> Void {
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("IPhone", forHTTPHeaderField: "User-Agent")
//        if cookies.count>0 {
//            
//            request.addValue(self.getCookiesHeaderField(), forHTTPHeaderField: "Cookie")
//            
//        }
        completetionHandler(request: request)
    }
    
    func send(request:NSMutableURLRequest,isAsynchronous:Bool,isTokenRequired:Bool,isCancelRequired:Bool,isReloadRequired:Bool,completionHandler completetionHandler:((Bool,NSData)->Void),faultHandler:((NSInteger,String,NSData)->Void)?,errorHandler:((NSError)->Void)) -> Void {
        self.configureRequest(request, isTokenRequired: isTokenRequired) { (request) in
           // var postData:NSData? = nil
           // postData = request.HTTPBody
            //var bodyData:NSString? = nil
          //  bodyData = NSString(data:postData!, encoding:NSUTF8StringEncoding) as! String
            print("HTTP URL\(request.URL)")
          //  print("HTTP POST DATA\(bodyData)")
            print("HTTP HEADER FIELD\(request.allHTTPHeaderFields)")
            
            if isAsynchronous  {
                    self.sendAsyncRequest(request, isCancelRequired: false, isReloadRequired: false, completionHandler: completetionHandler, faultHandler: faultHandler!, errorHandler:errorHandler)
            }
        }
    }

    func sendAsyncRequest(request:NSMutableURLRequest,isCancelRequired:Bool,isReloadRequired:Bool,completionHandler:CompletionHandler,faultHandler:(NSInteger,String,NSData)->Void,errorHandler:(NSError)->Void) -> Void {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")
            if error == nil && data != nil {
                do {
                    if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) {
                        if let dict = jsonObject as? NSDictionary {
                            print(dict)
                            completionHandler(true,(data?.copy())! as! NSData)
                    }
                        else{
                            print("not a dictionary")
                            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                            print("this is real data \(dataString!)")
                            completionHandler(true,(data?.copy())! as! NSData)
                        }
                    }
                    else {
                        print("Could not parse JSON: \(error!)")
                    }
                    dispatch_sync(self.operationalDipatchQueues(),{
                        completionHandler(true,(data?.copy())! as! NSData)
                        }
                    )
                } catch {
                    // Something went wrong
                    print("error  = \(error)")
                    errorHandler(((error as Any) as! NSError))
                    
                    
                }
            }
        })
        task.resume()
    }
    
    func getCookiesHeaderField() -> String {
        var cookiesValueArray =  NSMutableArray()
        for key in cookies {
            //objectForKey(key as! AnyObject))")
            let cookieValue = cookies.objectForKey(key as! AnyObject)
            if cookieValue?.count>0 {
                cookiesValueArray .addObject("\(key) = \(cookies.objectForKey(key as! AnyObject))")
            }
        }
        return cookiesValueArray.componentsJoinedByString(";")
    }
    
    func getURLRequestForService(service:String,isIncludeAPIRoot:Bool,params:NSDictionary) -> NSMutableURLRequest {
        
        var  urlString = self.getURLPathForService(service, isIncludeAPIRoot: isIncludeAPIRoot) as String
        if params.count > 0 {
            let questionMark:String = "?"
             urlString.stringByAppendingFormat(String(format: "?%@",self.parseParam(params)))
            
            let ParamString = self.parseParam(params)
            urlString = urlString+questionMark+(ParamString as String)
        }
        
        let url = NSURL(string: (urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding))!)
        let request = NSMutableURLRequest.init(URL: url!, cachePolicy:NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 30.0)
        return request
        
    }
    
    func parseParam(param: NSDictionary) -> NSString {
        let parseParamArray = NSMutableArray()
        for (key, value) in param {
            parseParamArray .addObject("\(key)=\(value)")
        }
        return parseParamArray .componentsJoinedByString("&")
    }
    
    func getURLPathForService(service:String,isIncludeAPIRoot:Bool) -> NSMutableString{
        
        let ALServerContextDevelopmentInstance = ALServerContextProduction()
        var apiRoot = "/"
        if isIncludeAPIRoot {
            apiRoot = ALServerContextDevelopmentInstance.api()
        }
        let urlPath =  NSMutableString(format:"%@/%@", ALServerContextDevelopmentInstance.domain(),apiRoot)
        if service.characters.count > 0
        {
            urlPath.appendString(service)
        }
        return urlPath
    }
    
    func setServerContext(context: ALServerContext) ->Void {
        serverContext = context
    }
    
    func serversContext() -> ALServerContext{
        return serverContext
        
    }
    
    func operationalDipatchQueues() -> dispatch_queue_t{
        if _operationDispatchQue == nil {
            _operationDispatchQue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        }
        return _operationDispatchQue!
    }
    
    func setOperationDispatchQueue(queue: dispatch_queue_t) -> Void{
        _operationDispatchQue = queue
    }
    
    func isAuthRequired() -> Bool {
        return true
    }
    
    func setConfigurationValueForKey(value: ALString, key: ALString)->Void {
        if value.characters.count != 0  {
            cookies.setObject(value, forKey: key)
        }
    }

    func getConfigurationValueForKey(key: ALString)-> ALString {
        return cookies.objectForKey(key) as! String
    }
    
    func removeConfigurationsValueForKey(key: ALString) {
        cookies.removeObjectForKey(key)
    }
    
    func getConfigurations() -> ALDictionary {
        return cookies
    }
    
    func clearConfigurations()->Void{
        cookies .removeAllObjects()
    }
  
    //******** GET Request ******************//
    
    func getServiceRequest(service:ALString, isIncludeAPIRoot:ALBool,postParams:ALDictionary, isAsyncRequest:ALBool,isTokenRequired:ALBool,isCancelRequired:ALBool,isReloadRequired:ALBool,completetionHandler:(success:ALBool,data:NSData,response:AnyObject)-> Void,faultHndler :(faultCode:Int,faultDetails:String,data:NSData)->Void,errorHandler:errorBlock)-> Void
    {
        var request:NSMutableURLRequest!
        request = self.getURLRequestForService(service, isIncludeAPIRoot: true, params: postParams)
        request.HTTPMethod = "GET"
        self.send(request, isAsynchronous: true, isTokenRequired: false, isCancelRequired: false, isReloadRequired: false, completionHandler: {
            (success:Bool, data:NSData) in
            if success{
                ALResponseParser().parseResponses(data, completetionHandler: { (success, data,response) in
                    if success{
                        completetionHandler(success: success, data: data,response: response)
                    }
                    else{
                        print("error")
                    }
                })
            }
            }, faultHandler: { (faultCode:NSInteger, faultDetails:String, data:NSData   ) in
                print(faultDetails)
        }){
            (error:NSError) in
            print("error is \(error)")
            errorHandler!(error: (error as Any) as! NSError)
        }
    }

    //******** POST Request ******************//

    
    func postServiceRequest(service:ALString, isIncludeAPIRoot:ALBool,postParams:ALDictionary, isAsyncRequest:ALBool,isTokenRequired:ALBool,isCancelRequired:ALBool,isReloadRequired:ALBool,completetionHandler:(success:ALBool,data:NSData,response:AnyObject)-> Void,faultHndler :(faultCode:Int,faultDetails:String,data:NSData)->Void,errorHandler:errorBlock)-> Void{
        
        var request:NSMutableURLRequest!
        request = self.getURLRequestForService(service, isIncludeAPIRoot: true, params: postParams)
        
        request.HTTPMethod = "POST"
        
       // request.HTTPBody = postData
        self.send(request, isAsynchronous: true, isTokenRequired: false, isCancelRequired: false, isReloadRequired: false, completionHandler: { (success:Bool, data:NSData) in
            
            if success{
                ALResponseParser().parseResponses(data, completetionHandler: { (success, data,response) in
                    if success{
                        completetionHandler(success: success, data: data,response: response)
                    }
                    else{
                        print("error")
                    }
                })
            }
            }, faultHandler: { (faultCode:NSInteger, faultDetails:String, data:NSData   ) in
                //
        }) { (error:NSError) in
             errorHandler!(error: (error as Any) as! NSError)
        }
     }
    }

struct ServerContext {
    
    init(serverContext:AnyObject)
    {
        
    }
    
    
    /*
 
     
     */
    
    
    
    
    
}
