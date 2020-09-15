func countTinyPairs(a: [Int], b: [Int], k: Int) -> Int {
    var index = 0
    if a.count == 0 {
        return 0
    }
    var totalTiny = 0
    while index < a.count {
        let aElement = a[index]
        let bElement = b[b.count-1-index]
        let aStr = String(aElement)
        let bStr = String(bElement)
        
        let tiny = "\(aStr)\(bStr)"
        let tinyInt = Int(tiny)
        if tinyInt! < k {
            totalTiny += 1
        }
        
        index += 1
    }
    
    return totalTiny
}


print(countTinyPairs(a: [1, 2, 3], b: [1, 2, 3], k: 31))