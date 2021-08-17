//
//  SumTwoStrings.swift
//  ttt
//
//  Created by Алена on 04.07.2021.
//

import Foundation

func sum(num1: String, num2: String) -> String {
    let x = Decimal(string: num1)
    let y = Decimal(string: num2)
    if let a = x, let b = y {
        let sum = a + b
        let result = "\(sum)"
        return result
    }
    return "Ошибка"
}

print(sum(num1: "0", num2: "99807654321") == "99807654321")
print(sum(num1: String(Int.max), num2: String(Int.max)) == "18446744073709551614")
print(sum(num1: "0", num2: "0") == "0")
print(sum(num1: "98765", num2: "5") == "98770")
print(sum(num1: "98765", num2: "495") == "99260")
print(sum(num1: "1126351526125351621621261", num2: "123212136263623127182182818218212121212") == "123212136263624253533708943569833742473")
