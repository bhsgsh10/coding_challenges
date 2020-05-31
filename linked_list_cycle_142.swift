/*
Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

Note: Do not modify the linked list.

 

Example 1:

Input: head = [3,2,0,-4], pos = 1
Output: tail connects to node index 1
Explanation: There is a cycle in the linked list, where tail connects to the second node.

Example 2:

Input: head = [1,2], pos = 0
Output: tail connects to node index 0
Explanation: There is a cycle in the linked list, where tail connects to the first node.

https://leetcode.com/problems/linked-list-cycle-ii/
*/

/**
 * Definition for singly-linked list. */
 // public class ListNode {
 //      public var val: Int
 //      public var next: ListNode?
 //      public init(_ val: Int) {
 //          self.val = val
 //          self.next = nil
 //      }
 //  }
 

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        var slow_p = head
        var fast_p = head
        var loopDetected = false
        while let nextSlow = slow_p?.next, let nextFast = fast_p?.next?.next {
            slow_p = nextSlow
            fast_p = nextFast
            
            if slow_p === fast_p {
                loopDetected = true
                break
            }
        }
        if loopDetected == true {
            slow_p = head
            
            while let _ = slow_p {
                if slow_p === fast_p {
                    return slow_p
                } else {
                    slow_p = slow_p?.next
                    fast_p = fast_p?.next
                    
                }
            }
        }
        
        return nil
    }
}