/*
Problem 745: You are standing at position 0 on an infinite number line. There is a goal at position target.

On each move, you can either go left or right. During the n-th move (starting from 1), you take n steps.

Return the minimum number of steps required to reach the destination.

Input: target = 3
Output: 2
Explanation:
On the first move we step from 0 to 1.
On the second step we step from 1 to 3.

Input: target = 2
Output: 3
Explanation:
On the first move we step from 0 to 1.
On the second move we step  from 1 to -1.
On the third move we step from -1 to 2.

 */

// Explanation for the solution: https://leetcode.com/problems/reach-a-number/discuss/112968/Short-JAVA-Solution-with-Explanation


 class Solution {
    func reachNumber(_ target: Int) -> Int {
        
        let modTarget = abs(target)
        var sum = 0
        var counter = 0
        while sum < modTarget {
            counter += 1
            sum += counter
            
        }
        /*Find the difference between sum and target. The goal is to get rid of the difference to reach target.
         For ith move, if we switch the right move to the left, the change in summation will be 2*i less.
         Now the difference between sum and target has to be an even number in order for the math to check out. */
        while (sum - modTarget) % 2 != 0 {
            counter += 1
            sum += counter
        }

        return counter
    }
}

let sol = Solution()
let numSteps = sol.reachNumber(-2)
print(numSteps)
