//
//  AnyToransformTests.swift
//  Example
//
//  Created by Futao on 16/6/16.
//  Copyright © 2016年 Ftkey. All rights reserved.
//

import XCTest
@testable import Example

import ObjectMapperTransforms
import ObjectMapper

class AnyToransformTests: XCTestCase {

 
    
    func testAnyToStringTransform() {
        let mapper = Mapper<AnyToStringTransformType>()
        print(NSNumber(value: true).stringValue.lowercased(),NSNumber(value: false).stringValue.lowercased())
        print(String(true),String(false))

        
        let bool: Bool = true
        let int: Int = 11
        let double: Double = 11.11
        let boolString = "\(bool)"
        let intString = "\(int)"
        let doubleString = "\(double)"
        let JSONString = "{\"bool\" : \(bool),\"double\" : \(double), \"int\" : \(int), \"boolString\" : \"\(boolString)\", \"intString\" : \"\(intString)\", \"doubleString\" : \"\(doubleString)\"}"

        let mappedObject = mapper.map(JSONString:JSONString)
        
        XCTAssertNotNil(mappedObject)
        XCTAssertEqual(mappedObject?.int, "11")
        XCTAssertEqual(mappedObject?.double, "11.11")
        XCTAssertEqual(mappedObject?.intString, "11")
        XCTAssertEqual(mappedObject?.doubleString, "11.11")
        XCTAssertEqual(mappedObject?.bool, "true")
        XCTAssertEqual(mappedObject?.boolString, "true")

    }

    func testAnyToIntTransform() {
        let mapper = Mapper<AnyToIntTransformType>()
        let bool: Bool = true
        let int: Int = 11
        let double: Double = 11.11
        let boolString = "\(bool)"
        let intString = "\(int)"
        let doubleString = "\(double)"
        let JSONString = "{\"bool\" : \(bool),\"double\" : \(double), \"int\" : \(int), \"boolString\" : \"\(boolString)\", \"intString\" : \"\(intString)\", \"doubleString\" : \"\(doubleString)\"}"
        let mappedObject = mapper.map(JSONString:JSONString)
        
        XCTAssertNotNil(mappedObject)
        XCTAssertEqual(mappedObject?.int, 11)
        XCTAssertEqual(mappedObject?.double, 11)
        XCTAssertEqual(mappedObject?.intString, 11)
        XCTAssertEqual(mappedObject?.doubleString, 11)
        XCTAssertEqual(mappedObject?.bool, 1)
        XCTAssertEqual(mappedObject?.boolString, 1)
    }
    func testAnyToDoubleTransform()
    {
        let mapper = Mapper<AnyToDoubleTransformType>()
        let bool: Bool = true
        let int: Int = 11
        let double: Double = 11.11
        let boolString = "\(bool)"
        let intString = "\(int)"
        let doubleString = "\(double)"
        let JSONString = "{\"bool\" : \(bool),\"double\" : \(double), \"int\" : \(int), \"boolString\" : \"\(boolString)\", \"intString\" : \"\(intString)\", \"doubleString\" : \"\(doubleString)\"}"
        let mappedObject = mapper.map(JSONString:JSONString)
        
        XCTAssertNotNil(mappedObject)
        XCTAssertEqual(mappedObject?.int, 11.0)
        XCTAssertEqual(mappedObject?.double, 11.11)
        XCTAssertEqual(mappedObject?.intString, 11.0)
        XCTAssertEqual(mappedObject?.doubleString, 11.11)
        XCTAssertEqual(mappedObject?.bool, 1.0)
        XCTAssertEqual(mappedObject?.boolString, 1.0)
    }
    func testAnyToBoolTransform() {
        let mapper = Mapper<AnyToBoolTransformType>()
        let bool: Bool = true
        let int: Int = 0
        let double: Double = 11.11
        let boolString = "\(bool)"
        let intString = "\(int)"
        let doubleString = "\(double)"
        let JSONString = "{\"bool\" : \(bool),\"double\" : \(double), \"int\" : \(int), \"boolString\" : \"\(boolString)\", \"intString\" : \"\(intString)\", \"doubleString\" : \"\(doubleString)\"}"
        let mappedObject = mapper.map(JSONString:JSONString)
        
        XCTAssertNotNil(mappedObject)
        XCTAssertEqual(mappedObject?.int, false)
        XCTAssertEqual(mappedObject?.double, true)
        XCTAssertEqual(mappedObject?.intString, false)
        XCTAssertEqual(mappedObject?.doubleString, true)
        XCTAssertEqual(mappedObject?.bool, true)
        XCTAssertEqual(mappedObject?.boolString, true)
    }
}


class AnyToStringTransformType: Mappable {
    
    var int: String?
    var double: String?
    var intString: String?
    var doubleString: String?
    var bool: String?
    var boolString: String?

    init(){
        
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        int <- (map["int"], AnyToStringTransform())
        double <- (map["double"], AnyToStringTransform())
        intString <- (map["intString"], AnyToStringTransform())
        doubleString <- (map["doubleString"], AnyToStringTransform())
        bool <- (map["bool"], AnyToStringTransform())
        boolString <- (map["boolString"], AnyToStringTransform())

    }
}

class AnyToDoubleTransformType: Mappable {
    
    var int: Double?
    var double: Double?
    var intString: Double?
    var doubleString: Double?
    var bool: Double?
    var boolString: Double?
    init(){
        
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        int <- (map["int"], AnyToDoubleTransform())
        double <- (map["double"], AnyToDoubleTransform())
        intString <- (map["intString"], AnyToDoubleTransform())
        doubleString <- (map["doubleString"], AnyToDoubleTransform())
        bool <- (map["bool"], AnyToDoubleTransform())
        boolString <- (map["boolString"], AnyToDoubleTransform())
    }
}


class AnyToIntTransformType: Mappable {
    
    var int: Int?
    var double: Int?
    var intString: Int?
    var doubleString: Int?
    var bool: Int?
    var boolString: Int?
    init(){
        
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        int <- (map["int"], AnyToIntTransform())
        double <- (map["double"], AnyToIntTransform())
        intString <- (map["intString"], AnyToIntTransform())
        doubleString <- (map["doubleString"], AnyToIntTransform())
        bool <- (map["bool"], AnyToIntTransform())
        boolString <- (map["boolString"], AnyToIntTransform())
    }
}


class AnyToBoolTransformType: Mappable {
    
    var int: Bool?
    var double: Bool?
    var intString: Bool?
    var doubleString: Bool?
    var bool: Bool?
    var boolString: Bool?
    init(){
        
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        int <- (map["int"], AnyToBoolTransform())
        double <- (map["double"], AnyToBoolTransform())
        intString <- (map["intString"], AnyToBoolTransform())
        doubleString <- (map["doubleString"], AnyToBoolTransform())
        bool <- (map["bool"], AnyToBoolTransform())
        boolString <- (map["boolString"], AnyToBoolTransform())
    }
}
