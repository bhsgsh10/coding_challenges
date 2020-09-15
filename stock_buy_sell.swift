class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        let n = prices.count
        var buy = 0
        var sell = 0
        var profits = 0
        var index = 0
        while index < n - 1 {
            while index < n - 1 && prices[index+1] <= prices[index] {
                // we keep ruunning the loop till we keep finding a price that's better than the next one. 
                //For buying we allways want the price to be as low as possible.
                print("Incrementing index from \(index) to \(index+1) as local minima not found")
                index += 1
            }

            if index == n - 1 {
                break
            }

            buy = index
            index += 1
            
            while index < n && prices[index] >= prices[index-1] {
                // we keep ruunning the loop till we keep finding a price that's better than the previous one.
                print("Incrementing index from \(index) to \(index+1) as local maxima not found")
                index += 1
            }
            
            print("Current index is \(index)")
            // Decrement index by 1 because the local maxima was at one index behind the current one, which is why
            // the condition prices[index] >= prices[index-1] failed.
            sell = index - 1
            profits += prices[sell] - prices[buy]
        }
        
        return profits
    }
}

let solution = Solution()
let profit = solution.maxProfit([7,1,5,3,6,4])
print(profit)