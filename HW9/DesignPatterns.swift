//
//  DesignPatterns.swift
//
//  Created by Алена on 13.07.2021.
//

import Foundation

// Mediator

protocol Mediator {
    func notify(data: String, sender: TestObject)
}

class TeamMediator: Mediator {
    var objectsArray: [TestObject] = []
    func register(object: TestObject) {
        objectsArray.append(object)
    }
    func notify(data: String, sender: TestObject) {
        for object in objectsArray {
            if object.name != sender.name {
                object.receive(data: data)
            }
        }
    }
}

protocol TestObject {
    var name: String { get }
    var mediator: Mediator { get }
    func send(data: String)
    func receive(data: String)

}

class ObjectA: TestObject {
    var name: String
    var mediator: Mediator

    init(mediator: Mediator) {
        self.name = "A"
        self.mediator = mediator
    }

    func send(data: String) {
        mediator.notify(data: data, sender: self)
    }

    func receive(data: String) {
        print("Класс А получил: " + data)
    }
}

class ObjectB: TestObject {
    var name: String
    var mediator: Mediator

    init(mediator: Mediator) {
        self.name = "B"
        self.mediator = mediator
    }

    func send(data: String) {
        mediator.notify(data: data, sender: self)
    }

    func receive(data: String) {
        print("Класс B получил: " + data)
    }
}

let mediator = TeamMediator()
let objectA = ObjectA(mediator: mediator)
let objectB = ObjectB(mediator: mediator)
mediator.register(object: objectA)
mediator.register(object: objectB)
mediator.notify(data: "данные от объекта А", sender: objectA)


// Facade

class SubsystemA {
    func funcA() {
        print("Данные из подсистемы А")
    }
}

class SubsystemB {
    func funcB() {
        print("Данные из подсистемы B")
    }
}

class SubsystemC {
    func funcC() {
        print("Данные из подсистемы C")
    }
}

class Facade {
    let a = SubsystemA()
    let b = SubsystemB()
    let c = SubsystemC()

    func funcFacade() {
        a.funcA()
        b.funcB()
        c.funcC()
    }
}

let testFacade = Facade()
testFacade.funcFacade()


// Singleton

class SingletonClass {

    static let shared = SingletonClass()
    private init(){}

    func funcSingleton(){
        print("Singleton")
    }
}

SingletonClass.shared.funcSingleton()


// Factory Method

protocol Product {
    var color: String { get }
    func productFunc()
}

class ProductARed: Product {
    var color = "Красный"
    
    func productFunc() {
        print("Продукт А - красный")
    }
}

class ProductABlue: Product {
    var color = "Синий"
    
    func productFunc() {
        print("Продукт А - синий")
    }
}

class ProductA: Product {
    var color = "Цвет не определен"
    
    func productFunc() {
        print("Продукт A - цвет не определен")
    }
}

class ProductBRed: Product {
    var color = "Красный"
    
    func productFunc() {
        print("Продукт B - красный")
    }
}

class ProductBBlue: Product {
    var color = "Синий"
    
    func productFunc() {
        print("Продукт B - синий")
    }
}

class ProductB: Product {
    var color = "Цвет не определен"
    
    func productFunc() {
        print("Продукт B - цвет не определен")
    }
}

protocol Сreator {
    func creatorFunc(type: String) -> Product
    func creatorFactoryFunc(type: String) -> Product
}

extension Сreator {
    func creatorFunc(type: String) -> Product {
        
        let product = creatorFactoryFunc(type: type)
        product.productFunc()
        return product
    }
}

class CreatorA: Сreator {
    func creatorFactoryFunc(type: String) -> Product {
        switch type {
        case "red":
            return ProductARed()
        case "blue":
            return ProductABlue()
        default:
            return ProductA()
        }
    }
}

class CreatorB: Сreator {
    func creatorFactoryFunc(type: String) -> Product {
        switch type {
        case "red":
            return ProductBRed()
        case "blue":
            return ProductBBlue()
        default:
            return ProductB()
        }
    }
}

let product = CreatorA()
let productColor = product.creatorFactoryFunc(type: "red")
print(productColor.productFunc())
