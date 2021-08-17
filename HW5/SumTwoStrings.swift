//
//  SumTwoStrings.swift
//  ttt
//
//  Created by Алена on 04.07.2021.
//

import Foundation

func sum(num1: String, num2: String) -> String {
    var x = String(num1.reversed())
    var y = String(num2.reversed())
    
    if x.count < y.count {
        swap(&x, &y)
    }
    
    var result = [String]()
    var relocate = false
    
    for i in 0..<x.count {
        let index = x.index(x.startIndex, offsetBy: i)
        var sum = (x[index].wholeNumberValue ?? 0)
        
        if y.indices.contains(index) {
            sum += (y[index].wholeNumberValue ?? 0)
        }
        
        if relocate {
            sum += 1
        }
        
        relocate = sum > 9
        result.append(String(sum % 10))
    }
    
    if relocate {
        result.append("1")
    }
    
    let sumResult = result.joined()
    return String(sumResult.reversed())
}

print(sum(num1: "0", num2: "99807654321") == "99807654321")
print(sum(num1: String(Int.max), num2: String(Int.max)) == "18446744073709551614")
print(sum(num1: "0", num2: "0") == "0")
print(sum(num1: "98765", num2: "5") == "98770")
print(sum(num1: "98765", num2: "495") == "99260")
print(sum(num1: "1126351526125351621621261", num2: "123212136263623127182182818218212121212") == "123212136263624253533708943569833742473")
print(sum(num1: "117374723923829427492472947275295385487584757457482032032490243584353485384204",
     num2: "123485438574385734579823759823749832478324789327498237489237498324982374892374237") == "123602813298309564007316232771025127863812374084955719521269988568566728377758441")
