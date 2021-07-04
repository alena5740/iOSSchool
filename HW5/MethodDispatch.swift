//
//  MethodDispatch.swift
//  ttt
//
//  Created by Алена on 04.07.2021.
//

import Foundation

//Direct dispatch
protocol ProtocolDirectDispatch {
    func funcDirectDispatch()
}

extension ProtocolDirectDispatch {
    func funcDirectDispatch() {
        print("test")
    }
}

final class ClassDirectDispatch {
    
}

//Table dispatch

//Witness-Table
protocol ProtocolWitnessTable {
    func funcWitnessTable()
}

class ClassWitnessTable: ProtocolWitnessTable {
    func funcWitnessTable() {
        print("test")
    }
}

//Virtual-Table
class ClassVirtualTable {
    func funcVirtualTable() { }
}

class ClassСhildVT: ClassVirtualTable {
    func funcChild() {
        print("test")
    }
    
    override func funcVirtualTable() {
        print("test")
    }
}

//Message Dispatch
@objcMembers
class ClassMessageDispatch: NSObject {
    dynamic func funcMessageDispatch1() {
        print("test")
    }
    dynamic func funcMessageDispatch2() { }
}

@objcMembers
class ClassСhildMD: ClassMessageDispatch {
    override dynamic func funcMessageDispatch1() {
        print("test")
    }
    dynamic func funcMessageDispatch3() { }
}
