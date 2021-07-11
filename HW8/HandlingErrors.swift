//
//  HandlingErrors.swift
//
//  Created by Алена on 10.07.2021.
//

import Foundation

enum ErrorsCheckHomework: Error {
    case bigPercentFailTask(fail: String)
    case voidTask
    case invalidTask
}

enum ErrorsCheckTask: Error {
    case notTask
}

func checkHomework(array: [String]) throws -> String {
    let quantityTast = array.count
    var done = 0
    var fail = ""
    var failCount = 0
    var invalidTask = false

    for i in 0..<array.count {
        let task = array[i]
        do {
            let result = try checkTask(task: task)
            if result == "Правильно решено" {
                done += 1
            } else {
                fail = fail + "  " + task
                failCount += 1
            }
        }
        catch ErrorsCheckTask.notTask {
            invalidTask = true
            break
        }
    }
    
    guard !invalidTask else {
        throw ErrorsCheckHomework.invalidTask
    }
    
    guard quantityTast != 0 else {
        throw ErrorsCheckHomework.voidTask
    }
        
    guard !(Double(failCount) > (Double(quantityTast) * 0.75)) else {
        throw ErrorsCheckHomework.bigPercentFailTask(fail: fail)
    }
    
    return "Молодец"
}

func checkTask(task: String) throws -> String {
    let arrayTask = task.split(separator: " ")
    if arrayTask.count == 5 {
        let num1 = Int(arrayTask[0])
        let num2 = Int(arrayTask[2])
        let result = Int(arrayTask[4])
        let x = (arrayTask[1])
        var sum = 0
        if num1 != nil && num2 != nil {
            if x == "+" {
                sum = num1! + num2!
            } else if x == "-" {
                sum = num1! - num2!
            }
        }
        if result != nil {
            if sum == result {
                return "Правильно решено"
            } else {
                return "Ошибка, правильно: \(sum)"
            }
        }
    }
    throw ErrorsCheckTask.notTask
}

let arrayInvalid = ["32 + 16 = 48", "test"]
let arrayFailed = ["6 + 2 = 9", "1 + 1 = 1", "5 - 1 = 4", "2 + 2 = 5", "1 - 1 = 18"]
let arrayDone = ["32 + 16 = 48", "2 + 2 = 4", "5 - 1 = 4", "2 - 0 = 2"]
let arrayVoid: [String] = []

do {
    let result = try checkHomework(array: arrayDone)
    print(result)
} catch ErrorsCheckHomework.bigPercentFailTask(let fail) {
    print("Делай заново: \(fail)")
} catch ErrorsCheckHomework.invalidTask {
    print("Переделывай!")
} catch ErrorsCheckHomework.voidTask {
    print("Нет примеров")
}
