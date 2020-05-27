/*
Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

Note:

Your returned answers (both index1 and index2) are not zero-based.
You may assume that each input would have exactly one solution and you may not use the same element twice.

https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
*/

var twoSum = function(numbers, target) {
    var left = 0
    var right = numbers.length - 1
    var result = []
    while (left < right) {
        sum = numbers[left] + numbers[right]
        if (sum == target) {
            result.push(left + 1)
            result.push(right + 1)
            break
        } else if (sum > target) {
            right -= 1
        } else {
            left += 1
        }
    }
    return result
};