/*
Given a collection of intervals, merge all overlapping intervals.

Example 1:

Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
Example 2:

Input: [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.

https://leetcode.com/problems/merge-intervals/
*/

var merge = (intervals) => {
    intervals.sort((a,b) => {
        return a[0] - b[0]
    })
    
    var mergedIntervals = intervals
    var i = 0
    while (i < mergedIntervals.length - 1) {

        if (mergedIntervals[i][1] >= mergedIntervals[i+1][0]) {
            
            var mergedInterval = [Math.min(intervals[i][0],intervals[i+1][0]),
                                  Math.max(intervals[i][1], intervals[i+1][1])]
            
            mergedIntervals.splice(i,2,mergedInterval)
            
        } else {
            i += 1
        }
    }
    return mergedIntervals
};