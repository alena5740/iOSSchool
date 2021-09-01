//
//  ViewController.swift
//  Interop
//
//  Created by Алена on 01.09.2021.
//

import UIKit
import LibOne
import SubLibOne

public class ViewController: UIViewController {
    
    @objc public var struct1 = TestStructWrapper()
    @objc public var string = String()

    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let test = Test()
        let testLib = LibOne()
        let testLib2 = LibObjc2()
    }
}

public struct TestStruct {
    let value = 5
}

public class TestStructWrapper: NSObject {
    private let myStruct = TestStruct()
    
    @objc public var struct1: Int {
        myStruct.value
    }

}
