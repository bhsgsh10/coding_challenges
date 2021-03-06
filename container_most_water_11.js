/*
QUESTION:
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai).
n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines,
which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.

https://leetcode.com/problems/container-with-most-water/
*/

var maxArea = height => {
    var left = 0
    var right = height.length - 1
    var max_area = 0
    
    while (left < right) {
        var area = Math.min(height[left], height[right]) * (right - left)
        max_area = Math.max(area, max_area)

        if (height[left] < height[right]) {
            left = left + 1
        } else {
            right = right - 1
        }
    }
    
    return max_area
}