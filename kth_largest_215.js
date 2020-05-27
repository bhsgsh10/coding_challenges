/*
Implementation of kth largest element problem in JavaScript. This is faster than the python implementation.
*/

var findKthLargest = function(nums, k) {
    nums.sort(function(a,b) {
        return a - b
    })
    
    return nums[nums.length - k]
};