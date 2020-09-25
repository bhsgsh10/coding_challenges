class Node {
    
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BinaryTree {
    
    var root: Node
    
    init(rootValue: Int) {
        self.root = Node(value: rootValue)
    }
    
    func search(_ value: Int) -> Bool {
        
        var temp: Node? = root
        var parent: Node? = temp
        var visitedNodes: [Int: Node?] = [:]
        visitedNodes[root.value] = nil
        while true {
            if temp?.value == value {
                return true
            }

            if let left = temp?.left, visitedNodes[left.value] == nil {
                visitedNodes[left.value] = parent
                parent = temp
                temp = left
            } else if let right = temp?.right, visitedNodes[right.value] == nil {
                visitedNodes[right.value] = parent
                parent = temp
                temp = right
            } else {
                let temp2 = parent
                if let left = temp?.left, let _ = visitedNodes[left.value],
                    let right = temp?.right, let _ = visitedNodes[right.value] {
                    
                    if let value = temp?.value  {
                        if visitedNodes[value] == nil {
                            break
                        } else {
                            parent = visitedNodes[value] as? Node
                        }
                    }
                }
                temp = temp2
            }
        }
        
        
        return false
    }

    func printTree() -> String {
        
        return preorderPrint(root, traverse: "") ?? ""
    }

    // Helper method - use to construct a string representing the preordered nodes
func preorderPrint(_ start: Node?, traverse: String) -> String? {
    var result = traverse
    if let start = start {
        result += "\(start.value)"
        if let newValue = preorderPrint(start.left, traverse: result) {
            result = newValue
        }
        if let newValue = preorderPrint(start.right, traverse: result) {
            result = newValue
        }
    }
    return result
}

    // Helper method - use to create a recursive search solution.
    func preorderSearch(_ start: Node?, value: Int) -> Bool {
        if let start = start {
            if start.value == value {
                return true
            } else {
                return preorderSearch(start.left, value: value) || preorderSearch(start.right, value: value)
            }
        }
        return false
    }
    
    
}

// let tree = BinaryTree(rootValue: 1)
// tree.root.left = Node(value: 2)
// tree.root.right = Node(value: 3)
// tree.root.left?.left = Node(value: 4)
// tree.root.left?.right = Node(value: 5)

// // Test search
// //print(tree.search(4)) // Should be true
// print(tree.search(6)) // Should be false
// print(tree.printTree())

class BST {
    
    var root: Node
    
    init(value: Int) {
        self.root = Node(value: value)
    }
    
    func search(_ value: Int) -> Bool {
        searchHelper(root, value: value)
    }
    
    // create a node with the given value and insert it into the binary tree
    func insert(_ value: Int) {
        insertHelper(root, value: value)
    }
    
    // helper method - use to implement a recursive search function
    func searchHelper(_ current: Node?, value: Int) -> Bool {

        if let node = current {
            if node.value == value {
                return true
            } else if node.value < value {
                return searchHelper(node.right, value: value)
            } else if node.value > value {
                return searchHelper(node.left, value: value)
            }
        }

        return false
    }
    
    // helper method - use to implement a recursive insert function
    func insertHelper(_ current: Node, value: Int) {
        if current.value < value {
            if let right = current.right {
                insertHelper(right, value: value)
            } else {
                current.right = Node(value: value)
            }
        } else if current.value > value {
            if let left = current.left {
                insertHelper(left, value: value)
            } else {
                current.left = Node(value: value)
            }
        }
    }

    func preorderPrint(_ start: Node?, traverse: String) -> String? {
        var result = traverse
        if let start = start {
            result += "\(start.value)"
            if let newValue = preorderPrint(start.left, traverse: result) {
                result = newValue
            }
            if let newValue = preorderPrint(start.right, traverse: result) {
                result = newValue
            }
        }
        return result
    }

    func printTree() -> String {
        return preorderPrint(root, traverse: "") ?? ""
    }

}

// Test cases
// Set up tree
let tree = BST(value: 4)

// Insert elements
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.insert(5)


print(tree.printTree())

// Check search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false
