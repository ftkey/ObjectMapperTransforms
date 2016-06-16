# ObjectMapperTransforms

```
class AnyToStringTransformType: Mappable {
    
    var int: String?
    var double: String?
    var intString: String?
    var doubleString: String?
    var bool: String?
    var boolString: String?

    init(){
        
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        int <- (map["int"], AnyToStringTransforms())
        double <- (map["double"], AnyToStringTransforms())
        intString <- (map["intString"], AnyToStringTransforms())
        doubleString <- (map["doubleString"], AnyToStringTransforms())
        bool <- (map["bool"], AnyToStringTransforms())
        boolString <- (map["boolString"], AnyToStringTransforms())

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
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        int <- (map["int"], AnyToDoubleTransforms())
        double <- (map["double"], AnyToDoubleTransforms())
        intString <- (map["intString"], AnyToDoubleTransforms())
        doubleString <- (map["doubleString"], AnyToDoubleTransforms())
        bool <- (map["bool"], AnyToDoubleTransforms())
        boolString <- (map["boolString"], AnyToDoubleTransforms())
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
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        int <- (map["int"], AnyToIntTransforms())
        double <- (map["double"], AnyToIntTransforms())
        intString <- (map["intString"], AnyToIntTransforms())
        doubleString <- (map["doubleString"], AnyToIntTransforms())
        bool <- (map["bool"], AnyToIntTransforms())
        boolString <- (map["boolString"], AnyToIntTransforms())
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
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        int <- (map["int"], AnyToBoolTransforms())
        double <- (map["double"], AnyToBoolTransforms())
        intString <- (map["intString"], AnyToBoolTransforms())
        doubleString <- (map["doubleString"], AnyToBoolTransforms())
        bool <- (map["bool"], AnyToBoolTransforms())
        boolString <- (map["boolString"], AnyToBoolTransforms())
    }
}
```


```
    func testAnyToStringTransform() {
        let mapper = Mapper<AnyToStringTransformType>()
        print(NSNumber(bool: true).stringValue.lowercaseString,NSNumber(bool: false).stringValue.lowercaseString)
        print(String(true),String(false))

        
        let bool: Bool = true
        let int: Int = 11
        let double: Double = 11.11
        let boolString = "\(bool)"
        let intString = "\(int)"
        let doubleString = "\(double)"
        let JSONString = "{\"bool\" : \(bool),\"double\" : \(double), \"int\" : \(int), \"boolString\" : \"\(boolString)\", \"intString\" : \"\(intString)\", \"doubleString\" : \"\(doubleString)\"}"

        let mappedObject = mapper.map(JSONString)
        
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
        let mappedObject = mapper.map(JSONString)
        
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
        let mappedObject = mapper.map(JSONString)
        
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
        let mappedObject = mapper.map(JSONString)
        
        XCTAssertNotNil(mappedObject)
        XCTAssertEqual(mappedObject?.int, false)
        XCTAssertEqual(mappedObject?.double, true)
        XCTAssertEqual(mappedObject?.intString, false)
        XCTAssertEqual(mappedObject?.doubleString, true)
        XCTAssertEqual(mappedObject?.bool, true)
        XCTAssertEqual(mappedObject?.boolString, true)
    }
```