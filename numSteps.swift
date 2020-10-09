// Complete the stepPerms function below.
func stepPerms(n: Int) -> Int {
    var steps: [Int: Int] = [:]
    
    if steps[n] == nil {
        steps[n] = calculateSteps(n: n, steps: &steps)
    }
    

    return steps[n]!
}

func calculateSteps(n: Int, steps: inout [Int: Int]) -> Int {
    
    if steps[n] != nil {
        return steps[n]!
    }

    if n == 0 {
        return 0
    }

    if n == 1 {
        return 1
    }

    if n == 2 {
        return 2
    }

    if n == 3 {
        return 4
    }

    steps[n] = calculateSteps(n: n-1, steps: &steps) + calculateSteps(n: n-2, steps: &steps) + calculateSteps(n: n-3, steps: &steps)

    return steps[n]!
}

let n = 7
print(stepPerms(n: n))
