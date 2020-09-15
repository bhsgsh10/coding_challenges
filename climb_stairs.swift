class Solution {
    func climbStairs(_ n: Int) -> Int {
        var steps: [Int: Int] = [:]
        
        if n <= 2 {
            return n
        }
        
        steps[0] = 0
        steps[1] = 1
        steps[2] = 2
        var index = 0
        while index <= n {
            if steps[index] == nil {
                 steps[index] = steps[index-1]! + steps[index-2]!
            }
            
            index += 1
        }
        
        return steps[n]!
    }   
}

let sol = Solution()
let steps = sol.climbStairs(44)
print(steps)
