//
//  ALJsonParser.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/20/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit

class ALJsonParser: NSObject {

    
    
}

struct ALResponseParser {
    func parseResponses(data:NSData,completetionHandler:(success:Bool,data:NSData,response:AnyObject)->Void) -> Void {
        do {
            let error:NSError? = nil
            if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) {
                if let dict = jsonObject as? NSDictionary {
                    print(dict)
                    completetionHandler(success:true,data:data,response: dict)
                } else {
                    print("not a dictionary")
                    let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)
                    print("this is real data \(dataString!)")
                    completetionHandler(success:true,data:data,response: dataString!)
                }
            } else {
                print("Could not parse JSON: \(error!)")
            }
        } catch {
            // Something went wrong
        }
    }
    
    func isSuccess(responseDict:NSDictionary) -> Bool {
        if ALObjectUtils.getObjectFrom(responseDict, Key: "errors")?.count<0 {
            return true
        }
        return false
    }
    
    func isFailure(responseDict:NSDictionary) -> Bool {
        if ALObjectUtils.getObjectFrom(responseDict, Key: "errors")?.count>0 {
            return true
        }
        return false
    }
   
}
