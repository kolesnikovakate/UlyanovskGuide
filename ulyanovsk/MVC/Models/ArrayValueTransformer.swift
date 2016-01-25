//
//  ArrayValueTransformer.swift
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 25.01.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

import UIKit
import Foundation

class ArrayValueTransformer: NSValueTransformer {
    
    override func transformedValue(value: AnyObject?) -> AnyObject? {
        guard let randomString = value as? String else { return nil }
        return randomString.characters.split {$0 == " "}.map{String($0)}
    }
    
    override func reverseTransformedValue(value: AnyObject?) -> AnyObject? {
        guard let randomArray = value as? [String] else { return nil }
        return randomArray.reduce(" ", combine: { "\($0!) \($1)" })
    }
    
    override class func transformedValueClass() -> AnyClass {
        return NSArray.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }

}
