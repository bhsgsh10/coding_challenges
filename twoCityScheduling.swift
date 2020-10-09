/*
A company is planning to interview 2n people. Given the array costs where costs[i] = [aCosti, bCosti], the cost of flying the ith person to city a is aCosti, and the cost of flying the ith person to city b is bCosti.

Return the minimum cost to fly every person to a city such that exactly n people arrive in each city.

Example 1:

Input: costs = [[10,20],[30,200],[400,50],[30,20]]
Output: 110
Explanation: 
The first person goes to city A for a cost of 10.
The second person goes to city A for a cost of 30.
The third person goes to city B for a cost of 50.
The fourth person goes to city B for a cost of 20.

The total minimum cost is 10 + 30 + 50 + 20 = 110 to have half the people interviewing in each city.

https://leetcode.com/problems/two-city-scheduling/

*/

class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var costsCopy = costs
        //Sort the costs in ascending order of difference of acost and bcost. 
        costsCopy.sort {$0[0] - $0[1] < $1[0] - $1[1]}
        var minCost = 0
        var numA = 0
        var numB = 0
        for cost in costsCopy {
            // Since we have sorted the costs in ascending order of difference of acost and bcost, we'll pick acost for the 
            // first costsCopy.count/2 times, as the costs are arranged so that acost - bcost is either negative or slightly
            // positive in the beginning and would grow to a larger difference towards the end of the array. So it makes sense
            // to fill up the quota for acost first and then pick up bcost values.
            if numA < costsCopy.count / 2 {
                minCost += cost[0]
                numA += 1
            } else {
                minCost += cost[1]
                numB += 1
            }
        }
        
        return minCost
    }
}