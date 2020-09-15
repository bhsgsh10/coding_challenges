/*
Example:
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]
*/

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        if matrix.count == 0 || matrix.count == 1 {
            return 
        } 

        //Depending on the size of the matrix we'll have to iterate on the number of times the structure has to be rotated.
        let numCycles: Int = matrix.count / 2   
        var cycleIndex = 0
        let n = matrix.count
        while cycleIndex < numCycles {
            // keep shifting elements from the left as many number of times as number of rows in the matrix
            var index = cycleIndex
            while index < n - 1 - cycleIndex {

                let first = matrix[cycleIndex][index]

                matrix[cycleIndex][index] = matrix[n - 1 - index][cycleIndex]
                matrix[n - 1 - index][cycleIndex] = matrix[n-1-cycleIndex][n-1-index]
                matrix[n-1-cycleIndex][n-1-index] = matrix[index][n-1-cycleIndex]
                matrix[index][n-1-cycleIndex] = first

                index += 1
            }

            cycleIndex += 1
        }
    }
}


let sol = Solution()
var array = [[1,2,3],[4,5,6],[7,8,9]]
sol.rotate(&array)
print(array)
