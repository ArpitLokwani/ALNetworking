//
//  ALAsyncImageDownloader.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/30/16.
//  Copyright © 2016 Embitel. All rights reserved.
//

import UIKit

/*
 -(id)initWithFileURL:(NSString *)theFileURL successBlock:(void (^)(NSData *data))success failBlock:(void(^)(NSError *error))fail
 {
 self = [super init];
 
 if(self)
 {
 [self setMediaURL:nil];
 [self setFileURL:theFileURL];
 successCallbackFile = success;
 failCallback = fail;
 }
 
 return self;
 }
 */

class ALAsyncImageDownloader: NSObject {
// // var closureName: ((ParameterTypes) -> (ReturnType))?
 
    
    var successCallback:((image:UIImage)->Void)?
    var failCallback:((error:NSError)->Void)?
    var successCallbackFile:((data:NSData)->Void)?

  
    var mediaURL:ALString = ""
    var fileURL:ALString = ""
    var fileData:NSMutableData?
    
    
    func initWithMediaURL(theMediaURL:ALString,successBlock:((image:UIImage)->Void),failureBlock:((error:NSError)->Void)) -> Any {
        
        mediaURL = theMediaURL
        fileURL = ""
        successCallback = successBlock
        failCallback = failureBlock
        return self
    }

    func initWithFileURL(theFileURL:ALString,successBlock:((data:NSData)->Void)?,falureBlock:((error:NSError)->Void)?) -> Any {
        
        self.mediaURL = ""
        self.fileURL = theFileURL
        successCallbackFile = successBlock
        failCallback = falureBlock
        
        return self
        
    }
    
    func startDownload() -> Void {
        
        fileData = NSMutableData()
        let request:NSURLRequest?
        
        if fileURL.characters.count>0 {
            var url = NSURL(string: "URL")
            request = NSURLRequest(URL:NSURL(string: fileURL)!)
            
        }
        else{
            request = NSURLRequest(URL:NSURL(string: mediaURL)!)

        }
        
        let session = NSURLSession.sharedSession()

        let task = session.downloadTaskWithRequest(request!) {
            (
            let location, let response, let error) in
            
            guard let _:NSURL = location, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            if (response != nil){
                
                var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
                var data: NSData =  try! NSURLConnection.sendSynchronousRequest(request!, returningResponse: response)
                var err: NSError
                
                if self.fileURL.characters.count>0{
                    self.successCallbackFile!(data: data )
                    
                }
                else{
                    
                    let image = UIImage(data:data)
                    self.successCallback!(image:image!)
                    
                }
                
            }
        
    }
        task.resume()

        
       

    }
    
}

