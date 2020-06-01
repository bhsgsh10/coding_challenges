/*
ou are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.

https://leetcode.com/problems/add-two-numbers/

To note: Numbers can be arbitrarily large because each digit forms one node in the linked list,
 so they won't fit in UInt. For these type of questions, we start with a random node and link the results of the 
 summation of individual digits to tha node. Additionally, the approach is to take one pointer for each linked list and iterate
 till one of them runs out.
*/


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var nl1 = l1
        var nl2 = l2
        var sum = 0
        var carry = 0
        
        var sumHead: ListNode? = ListNode(-1)
        var node: ListNode? = sumHead
        
        while nl1 != nil || nl2 != nil {
            if nl1 != nil {
                sum += nl1!.val
                nl1 = nl1!.next
            } 
            
            if nl2 != nil {
                sum += nl2!.val
                nl2 = nl2!.next
            } 
            
            sum += carry
            carry = sum / 10
            
            
            sum = sum % 10
            
            var newNode: ListNode? = ListNode(sum)
            node?.next = newNode
            node = newNode
            
            sum = 0
        }
        
        if carry > 0 {
            var lastNode: ListNode? = ListNode(carry)
            node?.next = lastNode
        }
        
        return sumHead?.next
    }
}