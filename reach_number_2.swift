func min_steps(_ target: Int) -> Int {
    var startNum = 1
    var steps = 0
    var set: Set<Int> = Set()
    set.insert(1)
    while startNum != target {
        if startNum > target && set.contains(startNum/3) == false {
            startNum /= 3
        } else {
            startNum *= 2
        }
        set.insert(startNum)
        steps += 1
    }
    return steps
}

print(min_steps(11))
