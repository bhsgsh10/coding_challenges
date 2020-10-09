/**

Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

Example:

Input: [1,2,3,null,5,null,4]
Output: [1, 3, 4]
Explanation:

   1            <---
 /   \
2     3         <---
 \     \
  5     4       <---


This problem has been solved using BFS

 */ 
 public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
      }
  }

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        guard var rootNode = root else {
            return []
        }
        var rightNodes: [Int] = []

        var queue: [TreeNode] = []
        queue.append(rootNode)
        while !queue.isEmpty {
            let count = queue.count
            for i in 0..<count {

                let current = queue.removeFirst()
                // Take the rightmost node at level i and append its value to rightNodes
                if i == count - 1 {
                    rightNodes.append(current.val)
                }

                if let left = current.left {
                    queue.append(left)
                }

                if let right = current.right {
                    queue.append(right)
                }
                
            }
        }

       return rightNodes
    }
}

let t1 = TreeNode(1)
let t2 = TreeNode(2)
t1.right = t2

// let t3 = TreeNode(3)
// t1.right = t3

// let t4 = TreeNode(4)
// t3.right = t4
// let t5 = TreeNode(5)
// t2.right = t5

let sol = Solution()
print(sol.rightSideView(t1))

