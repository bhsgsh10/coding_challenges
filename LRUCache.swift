//
//  LRUCache.swift
//  
//
//  Created by Bhaskar Ghosh on 10/3/20.
//

import Foundation


class LRUCache {
    
    var cache: [Int: Int] = [:]
    var age: [Int: Int] = [:]
    var insertionOrder: [Int] = []
    var capacity = 0
    var index = 0
    var maxAge = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let value = cache[key] {
            maxAge += 1
            age[key] = maxAge
            return value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        
        if capacity == 0 {
            return
        }
        
        if let _ = cache[key] {
            cache[key] = value
            maxAge = maxAge + 1
            age[key] = maxAge
            return
        } else {
            
            cache[key] = value
            maxAge += 1
            age[key] = maxAge
            if cache.count > capacity {
                let minKey = age.min {a, b in a.value < b.value}!.0
                let _ = cache.removeValue(forKey: minKey)
                let _ = age.removeValue(forKey: minKey)
            }
        }
    }
}


 /* Your LRUCache object will be instantiated and called as such: */
let obj = LRUCache(2)
obj.put(1, 1)
obj.put(2, 2)
print(obj.get(1))
obj.put(3, 3)
print(obj.get(2))
obj.put(4, 4)
print(obj.get(1))
print(obj.get(3))
print(obj.get(4))


 
