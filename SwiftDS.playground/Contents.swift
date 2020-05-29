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
}

/*:
 ## Testing the implementation
 First we test `append` function, followed by the implementation of `append2`
 */
var linkedList = LinkedList(head: Node(value: "Bhaskar"))
linkedList.append(Node(value: "Hell ya"))
linkedList.append(Node(value: "Hell to you"))


var node = linkedList.head
while node != nil {
    print(node?.value ?? "NA")
    node = node?.next
}

var ll2 = LinkedList(head: Node(value: "Sanjana"))
ll2.append2(Node(value: "To the"))
ll2.append2(Node(value: "railway station"))

node = ll2.head
while let availableNode: Node = node {
    print(availableNode.value)
    node = availableNode.next
}
