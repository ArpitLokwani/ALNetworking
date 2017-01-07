//
//  ALAlias.swift
//  ALNetworkingSwift
//
//  Created by Arpit Lokwani on 7/7/16.
//  Copyright © 2016 Embitel. All rights reserved.
//


import Foundation

// alias

typealias ALString = String
typealias ALBool = Bool
typealias ALNSURLCredential = NSURLCredential
typealias ALArray =  NSArray
typealias ALMutableDictionary =  NSMutableDictionary
typealias ALDictionary =  NSDictionary
typealias ALMutableString =  NSMutableString
typealias ALInteger =  NSInteger

//Handler Blocks
typealias CompletionHandler = (Bool, NSData)->(Void)?
typealias completionHandlerBlk = (success:ALBool,data:NSData,response:AnyObject)->Void
typealias boolDictionaryStringErrorBlock = ((success:Bool,response:NSDictionary,output:NSString,error:NSError) -> Void)?
typealias notification = ((motification:NSNotification) -> Void)?
typealias arrayBlock  = ((array:NSArray) -> Void)?
typealias errorBlock = ((error:NSError) -> Void)?
typealias boolBlock  = ((success:Bool) -> Void)?
typealias integerBlock=((intValue:NSInteger) -> Void)?
typealias dataBlock = ((data:NSData) -> Void)?
typealias voidBlock = ((Void) -> Void)?
typealias boolArrayBlock = ((success:Bool,array:NSArray) -> Void)?
typealias boolErrorStringBlock = ((succes:Bool,value:String,stringValue:NSString) ->Void)?
typealias boolDictinaryBlock = ((success:Bool,NSDictionary) -> Void)?
typealias arrayErrorBlock = ((NSArray,NSError) -> Void)?
typealias dictionaryErrorBlock = ((NSDictionary,NSError) -> Void)?
typealias dataErrorBlock = ((NSData,NSError) -> Void)?