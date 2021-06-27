// COW без дженериков

class TestClass {
    var stringValue = "firstText"
}

struct TestStruct {
    private var testObject = TestClass()
    
    var cowValue: String {
        mutating get {
            if isKnownUniquelyReferenced(&testObject) {
                return testObject.stringValue
            } else {
                let secondTestObject = TestClass()
                secondTestObject.stringValue = testObject.stringValue
                testObject = secondTestObject
                return testObject.stringValue
            }
        } set {
            testObject.stringValue = newValue
        }
    }
    var intValue = 1
}

// Проверка
//var object1 = TestStruct()
//var object2 = object1
//
//object2.cowValue = "secondText"
//object2.intValue = 2
//
//print(object1.cowValue)
//print(object2.cowValue)
//print(object1.intValue)
//print(object2.intValue)


// Решение с дженериками

class GenTestClass<T> {
    var value : T
    init(_ genValue : T) {value = genValue}
}
struct GenTestStruct<T> {
    private var testObject : GenTestClass<T>
    init(_ genValue : T) {
        testObject = GenTestClass(genValue)
    }
    var cowValue: T {
        get {
            return testObject.value
        }
        set {
            if (!isKnownUniquelyReferenced(&testObject)) {
                testObject = GenTestClass(newValue)
                return
            }
            testObject.value = newValue
        }
    }
}

// Проверка
//var obj1 = GenTestStruct<String>("firstGenText")
//var obj2 = obj1
//
//obj1.cowValue = "secondGenText"
//
//print(obj1.cowValue)
//print(obj2.cowValue)
