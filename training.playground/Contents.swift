import UIKit

///// Checking substring in string
//func fuzzyContains(str: String, substring: String) -> Bool {
//
//    var doesContain = false
//
//    if let _ = str.range(of: substring, options: .caseInsensitive) {
//        doesContain = true
//    }
//
//    //or do this
////    if let _ = str.uppercased().range(of: substring.uppercased()) {
////        doesContain = true
////    }
//
//    return doesContain
//}
//
//let str = "Hello World"
//let subStr = "Kallo"
//fuzzyContains(str: str, substring: subStr)
//
//
///// Counting the number of times a character appears in a string
//let sampleStr = "Hello World"
//let sampleChar: Character = "l"
//
//let arrStr = Array(sampleStr)
//var initialFreq = 0
//
//
////func challenge5b(input: String, count: Character) -> Int {
////    return input.reduce(0) {
////        $1 == count ? $0 + 1 : $0
////    }
////}
//
//let freq = sampleStr.reduce(0, { x, y in
//    return y == sampleChar ? x + 1 : x
//
//})
//print(freq)
//
//var numbers = [1,2,3,4]
//
//numbers = numbers.map { x in
//    return x * 2
//}
//
//let sum  = numbers.reduce(0, {x, y in
//    x + y
//})

//Return all subsets of given set
//let nums = [3,2,4,1]
//var subsetsNums: [[Int]] = [[]]
//var index = 0
//
//for num in nums {
//    subsetsNums += subsetsNums.map {
//        return $0 + [num]
//    }
//}
//print(subsetsNums)

// Two city scheduling
/*
class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        
        var cityACosts: [Int] = []
        var cityBCosts: [Int] = []
        
        let sortedCosts = costs.sorted {abs($0.first! - $0.last!) > abs($1.first! - $1.last!)}
        for cost in sortedCosts {
            if cost.first! <= cost.last! {
                if cityACosts.count < costs.count / 2 {
                    cityACosts.append(cost.first!)
                } else {
                    cityBCosts.append(cost.last!)
                }
            } else {
                if cityBCosts.count < costs.count / 2 {
                    cityBCosts.append(cost.last!)
                } else {
                    cityACosts.append(cost.first!)
                }
            }
        }
        
        return cityACosts.reduce(0, +) + cityBCosts.reduce(0, +)
    }
}

let sol = Solution()
let minCost = sol.twoCitySchedCost([[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]])

let arr = [[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]]
let mapped = arr.map {
    $0[0] - $0[1]
}
mapped
*/
// Integer division example
let x: Int = 128
let y: Int = 3
print(x/y)

let str = "asdbsjhbh"
str.contains("variety")

