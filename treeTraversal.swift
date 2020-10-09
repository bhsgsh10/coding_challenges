/*
Tree traversal techniques
*/

/**
 * Definition for a binary tree node. */
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {

        guard let treeRoot = root else {return []}

        var nodeVals = [Int]()
        
        nodeVals += inorderTraversal(treeRoot.left)
        // write this before left subtree traversal if we want preorder traversal, 
        // and after right subtree traversal if we want postorder traversal
        nodeVals.append(treeRoot.val) 
        nodeVals += inorderTraversal(treeRoot.right)
        
        return nodeVals
        
    }

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]]  {

        guard let tRoot = root else { return []}
        var traversedNodes: [[Int]] = []
        var queue: [TreeNode] = [tRoot]
        var index = 0
        // if index is odd then traversal will happen right to left, else left to right
        while !queue.isEmpty {
            let count = queue.count
            var level: [Int] = []
            
            for _ in 0..<count {
                let element = queue.removeFirst()
                level.append(element.val)
                if let left = element.left {
                    queue.append(left)
                }
                if let right = element.right {
                    queue.append(right)
                }
            }
            if index % 2 == 0 {
                traversedNodes.append(level)
            } else {
                traversedNodes.append(level.reversed())
            }
            index += 1
            
        }
        return traversedNodes
    }

    func traverse(_ root: TreeNode?) {
        guard let tRoot = root else {
            return
        }

        var queue = [tRoot]
        while !queue.isEmpty {
            let element = queue.removeFirst()
            print(element.val)
            if let left = element.left {
                queue.append(left)
            }

            if let right = element.right {
                queue.append(right)
            }
        }
    }
}

let sol = Solution()

let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)

node1.right = node2

node2.left = node3

print(sol.inorderTraversal(node1))

let n4 = TreeNode(1)
let n5 = TreeNode(2)
n4.left = n5

let n6 = TreeNode(3)
n4.right = n6

let n7 = TreeNode(4)
n5.left = n7

let n8 = TreeNode(5)
n6.right = n8

print(sol.zigzagLevelOrder(n4))
//print(sol.traverse(n4))

