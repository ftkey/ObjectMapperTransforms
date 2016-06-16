//
//  AnyToTransforms.swift
//  ObjectMapperTransforms
//
//  Created by Futao on 16/6/16.
//  Copyright © 2016年 Futao.me. All rights reserved.
//

import Foundation
import ObjectMapper

public class AnyToStringTransform: TransformType {
    
    public typealias Object = String
    public typealias JSON = String
    /**
     *  allowBooleanString:true
     */
    public init() {}
    
    public func transformFromJSON(value: AnyObject?) -> Object? {
        if let value = value as? NSNumber {
            if value.isBoolType {
                return String(value.boolValue)
            }else{
                return String(value)
            }
        }
        else if let value = value as? String {
            return value
        }
        else if let value = value as? Bool {
            return String(value)
        }
        return nil
    }
    
    public func transformToJSON(value: Object?) -> JSON? {
        if let value = value {
            return value
        }
        return nil
    }
    
}

public class AnyToDoubleTransform: TransformType {
    
    public typealias Object = Double
    public typealias JSON = Double
    
    var allowBooleanString = true
    
    /**
     *  allowBooleanString:true
     */
    public init() {}
    public init(allowBooleanString allow: Bool) {
        allowBooleanString = allow
    }
    
    public func transformFromJSON(value: AnyObject?) -> Object? {
        if let value = value as? NSNumber {
            return value.doubleValue
        }
        else if let value = value as? String {
            if allowBooleanString {
                if value == String(true) {
                    return trueNumber.doubleValue
                }else if value == String(false) {
                    return falseNumber.doubleValue
                }else {
                    return atof(value)
                }
            }else {
                return atof(value)
            }
            
        }
        else if let value = value as? Bool {
            return value ? trueNumber.doubleValue : falseNumber.doubleValue
        }
        return nil
    }
    
    public func transformToJSON(value: Object?) -> JSON? {
        if let value = value {
            return value
        }
        return nil
    }
}

public class AnyToIntTransform: TransformType {
    
    public typealias Object = Int
    public typealias JSON = Int
    
    var allowBooleanString = true
    
    /**
     *  allowBooleanString:true
     */
    public init() {}
    public init(allowBooleanString allow: Bool) {
        allowBooleanString = allow
    }
    
    public func transformFromJSON(value: AnyObject?) -> Object? {
        if let value = value as? NSNumber {
            return value.integerValue
        }
        else if let value = value as? String {
            if allowBooleanString {
                if value == String(true) {
                    return trueNumber.integerValue
                }else if value == String(false) {
                    return falseNumber.integerValue
                }else {
                    return atol(value)
                }
            }else {
                return atol(value)
            }
        }
        else if let value = value as? Bool {
            return NSNumber(bool: value).integerValue
        }
        return nil
    }
    
    public func transformToJSON(value: Object?) -> JSON? {
        if let value = value {
            return value
        }
        return nil
    }
}
public class AnyToBoolTransform: TransformType {
    
    public typealias Object = Bool
    public typealias JSON = Bool
    
    var allowBooleanString = true
    
    /**
     *  allowBooleanString:true
     */
    public init() {}
    public init(allowBooleanString allow: Bool) {
        allowBooleanString = allow
    }
    
    public func transformFromJSON(value: AnyObject?) -> Object? {
        if let value = value as? NSNumber {
            return value.boolValue
        }
        else if let value = value as? String {
            if allowBooleanString {
                if value == String(true) {
                    return true
                }else if value == String(false) {
                    return false
                }else {
                    return NSNumber(integer: atol(value)).boolValue
                }
            }else {
                return NSNumber(integer: atol(value)).boolValue
            }
            
        }
        else if let value = value as? Bool {
            return value
        }
        return nil
    }
    
    public func transformToJSON(value: Object?) -> JSON? {
        if let value = value {
            return value
        }
        return nil
    }
    
}

private let trueNumber = NSNumber(bool: true)
private let falseNumber = NSNumber(bool: false)
private let trueObjCType = String.fromCString(trueNumber.objCType)
private let falseObjCType = String.fromCString(falseNumber.objCType)

// MARK: - NSNumber: Comparable
private extension NSNumber {
    var isBoolType:Bool {
        get {
            let objCType = String(UTF8String: self.objCType)
            if (self.compare(trueNumber) == NSComparisonResult.OrderedSame && objCType == trueObjCType)
                || (self.compare(falseNumber) == NSComparisonResult.OrderedSame && objCType == falseObjCType){
                return true
            } else {
                return false
            }
        }
    }
}

