/*
Given an unsorted array of integers, find the length of longest increasing subsequence.

Example:

Input: [10,9,2,5,3,7,101,18]
Output: 4 
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4. 
Note:

There may be more than one LIS combination, it is only necessary for you to return the length.
Your algorithm should run in O(n^2) complexity.

Follow up: Could you improve it to O(n log n) time complexity?

https://leetcode.com/problems/longest-increasing-subsequence/

This problem can be solved using a dynamic programming methodology.
We can approach the problem in two ways, as indicated in the question. Both of them are given below. */

/*
The first approach uses two loops, an additional array, which is initialized with 1s at the beginning. The values in that array
are updated to indicate the max length of a subsequence running upto every index. Finally, we take a max of all the values in
that array to get the answer.
*/
///First approach using dynamic programming O(n^2)
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        guard nums.count > 1 else {
            return 1
        }
        
        var lis = Array(repeating: 1, count: nums.count)
        for i in 1...nums.count-1 {
            for j in 0...i-1 {
                if nums[i] > nums[j] {
                    // take the max of the existing value of lis at i and the value of j plus 1. We add 1 because the length of
                    // the subsequence will increase by 1 when the current element is included. 
                    lis[i] = max(lis[i], lis[j] + 1)
                }
            }
        }
        
        return lis.max()!
    }
}

/*
The second methodology is more nuanced. Instead of taking an array and initializing it with 1s, it starts out by creating an array
containing the first element of nums. Let's call this array `lis`. As we iterate through nums, we find the appropriate place for the 
new values in lis using binary search, so that lis is always a strictly increasing sequence. In the process, we remove those 
elements from lis that hinder it from growing. At the end we are left with a longest increasing subsequence. The length of lis gives
the answer.

O(nlogn)
 */
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var lis = [Int]()
        guard nums.count > 0 else {
            return 0
        }
        guard nums.count > 1 else {
            return 1
        }
        
        lis = [nums.first!] 
        // starting the loop from 1, as 0th element is already added to lis.
        for i in 1..<nums.count {
            var left = 0
            var right = lis.count
            // Performing a binary search over lis to determine the position of the new element.
            while left < right {
                var mid = Int((right + left) / 2)
                if lis[mid] < nums[i] {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            //Append the new element to lis if it is greater than all previous elements in lis
            if right >= lis.count {
                lis.append(nums[i])
            } else {
                // Replace the element at the end of lis with the new element. This happens when the incoming element is smaller
                // than the greatest element in lis. Smaller the last element, higher is the chance of getting a bigger subsequence.
                lis[right] = nums[i]
            }
        }
        return lis.count
    }
}



