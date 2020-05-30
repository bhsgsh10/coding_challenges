/*:
 # Implementing Stacks
 Using linked lists
 */

class Node {
    
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

/*:
 Methods for nodes and linked lists have already been implemented
 */

class LinkedList {
    
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {
        
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    func getNode(atPosition position: Int) -> Node? {
        guard position > 0 else {
            return nil
        }
        
        var counter = 1
        var current = head
        
        while current != nil && counter <= position {
            if counter == position {
                return current
            }
            current = current?.next
            counter += 1
        }
        return nil
    }
    
    func insertNode(_ node: Node, at position: Int) {
        guard position > 0 else {
            return
        }
        
        var counter = 1
        var current = head
        
        if position > 1 {
            while current != nil && counter < position {
                if counter == position - 1 {
                    node.next = current?.next
                    current?.next = node
                }
                current = current?.next
                counter += 1
            }
        } else if position == 1 {
            node.next = head
            head = node
        }
    }
    
    func deleteNode(withValue value: Int) {
        var current = head
        var previous: Node?
        
        while current?.value != value && current?.next != nil {
            previous = current
            current = current?.next
        }
        
        if current?.value == value {
            if previous != nil {
                previous?.next = current?.next
            } else {
                head = current?.next
            }
        }
    }
}

class Stack {
    
    var ll: LinkedList
    
    init(top: Node?) {
        self.ll = LinkedList(head: top)
    }
    
    // add a node to the top of the stack
    func push(_ node: Node) {
        ll.insertNode(node, at: 1)
    }
    
    // remove and return the topmost node from the stack
    func pop() -> Node? {
        
        if let firstNode = ll.getNode(atPosition: 1) {
            let value = firstNode.value
            ll.deleteNode(withValue: value)
            return firstNode
        }
    
        return nil
    }
}

/*:
 ## Test cases
 */
// Set up some nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)

// Start setting up a Stack
let stack = Stack(top: n1)

// Test stack functionality

stack.push(n2)
stack.push(n3)

var node = stack.ll.head
while let _ = node {
    print(node?.value ?? "NIL")
    node = node?.next
}


print(stack.pop()!.value) // Should be 3
print(stack.pop()!.value) // Should be 2
print(stack.pop()!.value) // Should be 1
print(stack.pop()?.value) // Should be nil
stack.push(n4)
print(stack.pop()!.value) // Should be 4
print("-------------------------------------------------------")
/*:
 # Implementing queues
 Using Arrays
 */
import Foundation

class Queue {
    
    var storage: [Int]
    
    init(head: Int) {
        storage = [head]
    }
    
    // add the element to the queue
    func enqueue(_ element: Int) {
        storage.append(element)
    }
    
    // return the next element to be dequeued from the queue
    // if the queue is empty, return nil
    func peek() -> Int? {
        guard storage.count > 0 else {
            return nil
        }
        return storage.first
    }
    
    // remove and return the next element to be dequeued
    func dequeue() -> Int? {
        guard storage.count > 0 else {
            return nil
        }
        return storage.remove(at: 0)
    }
}

/*:
 ## Test cases for queues
 */

// Setup
let q = Queue(head: 1)
q.enqueue(2)
q.enqueue(3)

// Test peek
print(q.peek()!) // Should be 1

// Test dequeue
print(q.dequeue()!) // Should be 1
 
// Test enqueue
q.enqueue(4)
print(q.dequeue()!) // Should be 2
print(q.dequeue()!) // Should be 3
print(q.dequeue()!) // Should be 4
q.enqueue(5)
print(q.peek()!) // Should be 5

