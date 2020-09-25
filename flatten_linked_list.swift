/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    func flatten(_ head: Node?) -> Node? {
        
        func flattenHelper(_ head: Node?) -> Node? {
            guard var listHead = head else {
                 return head
            }

            var child = listHead.child
            var next = listHead.next

            var childTail = flattenHelper(listHead.child)
            var nextTail = flattenHelper(listHead.next)
            
            var tail: Node? = listHead
            listHead.child = nil
            
            if child != nil {
                listHead.next = child
                child?.prev = listHead
                tail = childTail
            }
            
            if next != nil {
                tail.next = next
                next?.prev = tail
                tail = nextTail
            }
            
            return tail
        }
        
        var tail = flattenHelper(head)
        return head

    }
}

/* The logic for flattening a multi level linked list as shown here can be used to flatten a binary tree to linked list (removing the 
prev pointers). */