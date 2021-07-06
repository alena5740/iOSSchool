//
//  HigherOrderFunctions.swift
//
//  Created by Алена on 06.07.2021.
//

import Foundation

func map<T, U>(array: [T], mapClosure: ((T) -> U)) -> [U] {
    return array.reduce([]) { result, element in
        return result + [mapClosure(element)]
    }
}

func filter<T>(array: [T], filterClosure: ((T) -> Bool)) -> [T] {
    return array.reduce([]) { result, element in
        filterClosure(element) ? result + [element] : result
    }
}

//Проверка
let array = [1, 7, 3]
let arrayMap = map(array: array) { element in
    return element + 3
}
let arrayFilter = filter(array: array) { element in
    element < 4
}

print(arrayMap)
print(arrayFilter)
