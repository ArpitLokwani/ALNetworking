//
//  ALNEtworkConnection.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 18/07/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit


class ALNetworkConnection: NSObject {
    
   typealias CompletionHandler = ((response:NSURLResponse,data:NSData,connectionError :NSError,session:NSURLSession) -> (Void))?

    var completionHandlerBlk :CompletionHandler!
    
    static func sendAsynchronousRequest(request:NSURLRequest,completeionHandler:((response:String,error:String)->Void)) -> Void {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                completeionHandler(response: "",error: error!.description)
            } else {
                let result = NSString(data: data!, encoding:
                    NSASCIIStringEncoding)!
                completeionHandler(response: result as String, error: "")
            }
        }
        task.resume()
    }
}
