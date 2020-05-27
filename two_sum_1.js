/*
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.
https://leetcode.com/problems/two-sum/
*/

var twoSum = function(nums, target) {
    var dict = {}
    var result = []
    for (index = 0; index < nums.length; index++) {
        var num = nums[index]
        complement = target - num
            if (complement in dict) {
                result[0] = index
                result[1] = dict[complement]
                break
            } else {
                dict[num] = index
            }
    }
    return result
};