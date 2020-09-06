/*
Given a singly linked list, return a random node's value from the linked list. Each node must have the same probability of being chosen.

Follow up:
What if the linked list is extremely large and its length is unknown to you? Could you solve this efficiently without using extra space?

Example:

// Init a singly linked list [1,2,3].
ListNode head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
Solution solution = new Solution(head);

// getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
solution.getRandom();


https://leetcode.com/problems/linked-list-random-node/

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

    /** @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node. */
    var listLength: Int = 0
    var linkedList: ListNode?
    // calculate the length of the given linked list which we will use later to generate the random number
    init(_ head: ListNode?) {
        self.linkedList = head
        var node = head
        while let _ = node {
            self.listLength += 1
            node = node?.next
        }
    }
    
    /** Returns a random node's value. */
    func getRandom() -> Int {
        //Normally we'd check if the head is nil, but it is given in the definition of ListNode that the head always contains 
        // atleast one node.
        //Generate a random number between 1 and the length of the list
        let randomInt = Int.random(in: 1..<self.listLength+1)
        var node = self.linkedList
        var counter = 1
        // Iterate through the list till we find the node at randomInt position
        while counter < randomInt && node != nil {
            counter += 1
            node = node?.next
        }
        return node!.val
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */