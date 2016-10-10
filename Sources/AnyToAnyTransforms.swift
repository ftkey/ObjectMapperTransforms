//
//  AnyToTransforms.swift
//  ObjectMapperTransforms
//
//  Created by Futao on 16/6/16.
//  Copyright © 2016年 Futao.me. All rights reserved.
//

import Foundation
import ObjectMapper

open class AnyToStringTransform: TransformType {
    
    public typealias Object = String
    public typealias JSON = String
    /**
     *  allowBooleanString:true
     */
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> Object? {
        if let value = value as? NSNumber {
            if value.isBoolType {
                return String(value.boolValue)
            }else{
                return String(describing: value)
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
    
    open func transformToJSON(_ value: Object?) -> JSON? {
        if let value = value {
            return value
        }
        return nil
    }
    
}

open class AnyToDoubleTransform: TransformType {
    
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
    
    open func transformFromJSON(_ value: Any?) -> Object? {
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
                    let decimal = NSDecimalNumber(string: value)
                    if decimal == NSDecimalNumber.notANumber {
                        return nil
                    }else {
                        return decimal.doubleValue
                    }
                }
            }else {
                let decimal = NSDecimalNumber(string: value)
                if decimal == NSDecimalNumber.notANumber {
                    return nil
                }else {
                    return decimal.doubleValue
                }
            }
            
        }
        else if let value = value as? Bool {
            return value ? trueNumber.doubleValue : falseNumber.doubleValue
        }
        return nil
    }
    
    open func transformToJSON(_ value: Object?) -> JSON? {
        if let value = value {
            return value
        }
        return nil
    }
}

open class AnyToIntTransform: TransformType {
    
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
    
    open func transformFromJSON(_ value: Any?) -> Object? {
        if let value = value as? NSNumber {
            return value.intValue
        }
        else if let value = value as? String {
            if allowBooleanString {
                if value == String(true) {
                    return trueNumber.intValue
                }else if value == String(false) {
                    return falseNumber.intValue
                }else {
                    let decimal = NSDecimalNumber(string: value)
                    if decimal == NSDecimalNumber.notANumber {
                        return nil
                    }else {
                        return decimal.intValue
                    }
                }
            }else {
                let decimal = NSDecimalNumber(string: value)
                if decimal == NSDecimalNumber.notANumber {
                    return nil
                }else {
                    return decimal.intValue
                }
            }
        }
        else if let value = value as? Bool {
            return NSNumber(value: value as Bool).intValue
        }
        return nil
    }
    
    open func transformToJSON(_ value: Object?) -> JSON? {
        if let value = value {
            return value
        }
        return nil
    }
}
open class AnyToBoolTransform: TransformType {
    
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
    
    open func transformFromJSON(_ value: Any?) -> Object? {
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
                    let decimal = NSDecimalNumber(string: value)
                    if decimal == NSDecimalNumber.notANumber {
                        return nil
                    }else {
                        return decimal.boolValue
                    }
                }
            }else {
                let decimal = NSDecimalNumber(string: value)
                if decimal == NSDecimalNumber.notANumber {
                    return nil
                }else {
                    return decimal.boolValue
                }
            }
        }
        else if let value = value as? Bool {
            return value
        }
        return nil
    }
    
    open func transformToJSON(_ value: Object?) -> JSON? {
        if let value = value {
            return value
        }
        return nil
    }
    
}

private let trueNumber = NSNumber(value: true as Bool)
private let falseNumber = NSNumber(value: false as Bool)
private let trueObjCType = String(cString: trueNumber.objCType)
private let falseObjCType = String(cString: falseNumber.objCType)

// MARK: - NSNumber: Comparable
private extension NSNumber {
    var isBoolType:Bool {
        get {
            let objCType = String(validatingUTF8: self.objCType)
            if (self.compare(trueNumber) == ComparisonResult.orderedSame && objCType == trueObjCType)
                || (self.compare(falseNumber) == ComparisonResult.orderedSame && objCType == falseObjCType){
                return true
            } else {
                return false
            }
        }
    }
}

