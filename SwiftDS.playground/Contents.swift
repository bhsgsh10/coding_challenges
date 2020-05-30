/*:
 # Playground for Linked lists in Swift
 The following implementation shows how we can create nodes and linked lists in Swift.
 
 We'll begin by defining a Node class, that contains the value at the node and a pointer to the next node. The constructor for Node only requires us to specify the value that goes into a particular
 instance. `next`is specified explicitly after other nodes are created, thereby giving us the freedom to choose which node we want to link to.
 
*/

class Node {
    var value: Any
    var next: Node?
    
    init(value: Any) {
        self.value = value
    }
}

let node1 = Node(value: "Horse")
let node2 = Node(value: "Shoe")
node1.next = node2

print(node2.value)

/*:
 Next, we define the LinkedList class, which will utilize the Node class we have already created.
 */
/*:
 There are two methods provided that append elements to the linked list.
 - `append()`: Uses guard statement for early return
 - `append2()`: Used if-let
 `append`is the preferred method in this case as it is more optimal.
*/
class LinkedList {
    var head: Node?
    
    init(head: Node) {
        self.head = head
    }
    
    /// Appending nodes to the linked list
    func append(_ node: Node) {
        //early return
        guard head != nil else {
            print("Assigning head")
            head = node
            return
        }
        
        print("Assigning other nodes")
        var currentNode = head
        while let _ = currentNode?.next {
            currentNode = currentNode?.next
        }
        currentNode?.next = node
    }

    ///appending using if-let
    func append2(_ node: Node) {
        if let headNode: Node = head {
            var currentNode: Node? = headNode
            while let _ = currentNode?.next {
                currentNode = currentNode?.next
            }
            currentNode?.next = node
        } else {
            head = node
        }
    }
    
    /// Getting an individual node
    func getNode(atPosition position: Int) -> Node? {
        if position == 0 {
            return nil
        }
        var startPosition = 1
        var node: Node? = head
        while let _ = node {
            if startPosition == position {
                break
            } else {
                startPosition += 1
                node = node?.next
            }
        }
        
        return node
    }
    
    /// Inserting a node in a given position
    func insertNode(_ node: Node, at position: Int) {
        var linkNode: Node? = head
        var startPos = 1
        while let _ = linkNode {
            if position == 1 {
                node.next = head
                head = node
                return
            }
            // for other positions
            if startPos == position - 1 {
                break
            } else {
                startPos += 1
                linkNode = linkNode?.next
            }
        }
        if let nextNode: Node = linkNode?.next {
            node.next = nextNode
        }
        linkNode?.next = node
        
    }
    
    //Delete the first node with the given value
    func deleteNode(withValue value: Int) {
        if let node: Node = head {
            if node.value as? Int == value {
                head = head?.next
                return
            }
        }
        var node = head
        while let n: Node = node?.next {
            if n.value as? Int == value {
                node?.next = node?.next?.next
                return
            } else {
                node = node?.next
            }
        }
    }
}

/*:
 ## Testing the implementation
 Testing the functions we wrote above
 */
/*:
 Declaring new nodes
 */

var n1 = Node(value: 1)
var n2 = Node(value: 2)
var n3 = Node(value: 3)
var n4 = Node(value: 4)

/*:
 Declaring a new linked list
 */

var linkedList = LinkedList(head: n1)
linkedList.append(n2)
linkedList.append(n3)

/// Testing the getNode() function

print(linkedList.getNode(atPosition: 3)!.value)


/// Inserting a new node at position 3
linkedList.insertNode(n4, at: 3)
print(linkedList.getNode(atPosition: 3)!.value)

linkedList.append(Node(value: 1000))

/// Deleting a few nodes, including the first and the last node
linkedList.deleteNode(withValue: 4)
linkedList.deleteNode(withValue: 1)
linkedList.deleteNode(withValue: 1000)

/// Printing all the nodes in the linked list
var node = linkedList.head

while let availableNode: Node = node {
    print(availableNode.value)
    node = availableNode.next
}

var ll2 = LinkedList(head: Node(value: "Sanjana"))
ll2.append2(Node(value: "To the"))
ll2.append2(Node(value: "railway station"))

node = ll2.head
while let availableNode: Node = node {
    print(availableNode.value)
    node = availableNode.next
}

