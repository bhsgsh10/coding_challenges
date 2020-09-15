/**
 * Definition for singly-linked list. */
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let validList: ListNode = head else {return nil}
        
        
        var counter = 0
        var dict: [Int: ListNode] = [:]
        var node: ListNode? = validList
        while node != nil {
            dict[counter] = node!
            counter += 1
            
            node = node?.next
        }
        
        if n >= counter {
             return nil
        }
        
        dict.removeValue(forKey: counter-n)
        counter = counter - 1

        var newHead: ListNode? = ListNode()
        let keys = dict.keys.sorted(by: <)
        if keys.count > 0 {
            
            var temp: ListNode?
            for k in 0..<keys.count {
                if newHead == nil {
                    newHead?.val = dict[keys[k]]!.val ?? -1000
                    newHead?.next = dict[keys[k+1]] ?? nil
                    temp = newHead
                }
                print("Printing k = \(k)")
                temp?.next = dict[keys[k+1]]
                temp = temp?.next
            }
        }
        return newHead
    }
}

let head = ListNode(1)
let l2 = ListNode(2)
head.next = l2

// let l3 = ListNode(3)
// l2.next = l3

// let l4 = ListNode(4)
// l3.next = l4

// let l5 = ListNode(5)
// l4.next = l5

let sol = Solution()
var rem = sol.removeNthFromEnd(head, 1)
while rem != nil {
    print(rem?.val ?? 0)
    rem = rem?.next
}

