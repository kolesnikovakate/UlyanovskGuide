//
//  BackendService.swift
//  ulyanovsk
//
//  Created by Kolesnikova Ekaterina on 28/01/16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

import UIKit

class BackendService: NSObject {
    
    func getPlacesWithCompletion(completion: () -> NSError) {
        let manager = AFHTTPSessionManager()
        manager.GET("", parameters: nil, progress: nil, success: { (task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
            
            }) { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                
        }
    }
}
