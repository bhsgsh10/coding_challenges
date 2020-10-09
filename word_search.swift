/*
Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

Example:

board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

Given word = "ABCCED", return true.
Given word = "SEE", return true.
Given word = "ABCB", return false.

*/

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.count == 0 {
            return false
        }   

        func dfs(_ visited: inout [[Bool]], _ board: [[Character]], _ wordArray: [Character], _ cPos: Int, _ rowIndex: Int, _ colIndex: Int) -> Bool {
            let width = board[0].count
            let height = board.count

            if cPos >= wordArray.count {
                return true
            }
            if rowIndex < 0 || colIndex < 0 || rowIndex >= height || colIndex >= width || visited[rowIndex][colIndex] == true {
                return false
            }

            if wordArray[cPos] != board[rowIndex][colIndex] {
                return false
            }

            visited[rowIndex][colIndex] = true
            
            let result = dfs(&visited, board, wordArray, cPos+1, rowIndex+1, colIndex) ||
                         dfs(&visited, board, wordArray, cPos+1, rowIndex, colIndex+1) ||
                         dfs(&visited, board, wordArray, cPos+1, rowIndex-1, colIndex) ||
                         dfs(&visited, board, wordArray, cPos+1, rowIndex, colIndex-1)
            
            
            visited[rowIndex][colIndex] = false

            return result
        }

        let wordArr = [Character](word)
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
        
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if visited[i][j] == false && board[i][j] == wordArr[0] {
                    
                    if dfs(&visited, board, wordArr, 0, i, j) == true {
                        return true
                    }
                }
            }
        }
        return false
    }
}


let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]

let str = "ABCB"
let sol = Solution()
print(sol.exist(board, str))

