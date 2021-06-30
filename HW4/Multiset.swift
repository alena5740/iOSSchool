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
        for key in box.keys {
            if key == element, let count = box[element] {
                return count
            }
        }
        return 0
    }

    mutating func add(element: Element) {
        if box.isEmpty {
            box[element] = 1
        } else {
            for key in box.keys {
                var count = box[element] ?? 0
                if key == element {
                    count += 1
                    box[element] = count
                } else if count == 0 {
                    box[element] = 1
                }
            }
        }
    }

    func totalCount() -> Int {
        return box.count
    }

    mutating func remove(element:Element) {
        box.removeValue(forKey: element)
    }
}
