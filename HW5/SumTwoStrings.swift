//
//  SumTwoStrings.swift
//  ttt
//
//  Created by Алена on 04.07.2021.
//

import Foundation

func sum(num1: String, num2: String) -> String {
    let x = Int(num1)
    let y = Int(num2)
    if let a = x, let b = y {
        let sum = a + b
        let result = String(sum)
        return result
    }
    return "Ошибка. Введите корректные числа"
}
