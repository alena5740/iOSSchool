//
//  Multiset.swift
//  ttt
//
//  Created by Алена on 30.06.2021.
//

import Foundation

struct Multiset<Element: Hashable> {
    var box : [Element : Int] = [:]
    
    func count(for element: Element) -> Int {
        let count = box[element] ?? 0
        return count
    }
    
    mutating func add(element: Element) {
        if box.isEmpty {
            box[element] = 1
        } else {
            var count = box[element] ?? 0
            if count == 0 {
                box[element] = 1
            } else {
                count += 1
                box[element] = count
            }
        }
    }
    
    public var allElements: [Element] {
       var multiset = [Element]()
       for (key, value) in box {
         for _ in 0 ..< value {
            multiset.append(key)
         }
       }
       return multiset
     }
    
    func totalCount() -> Int {
        return allElements.count
    }
    
    // С методом removeAll я не очень поняла задание, должны ли удаляться все элементы или просто понижаться счетчик элемента. Поэтому сделала два варианта
    
    // Вариант 1: удаление элемента полностью
    mutating func removeAll(element: Element) {
        box.removeValue(forKey: element)
    }
    
    //Вариант 2: уменьшение счетчика элемента
    mutating func remove(element: Element) {
        if let count = box[element] {
            box[element] = count - 1
        }
    }
}
