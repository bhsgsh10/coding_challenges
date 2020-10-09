/*
Given a string s of '(' , ')' and lowercase English characters. 

Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

Formally, a parentheses string is valid if and only if:

It is the empty string, contains only lowercase characters, or
It can be written as AB (A concatenated with B), where A and B are valid strings, or
It can be written as (A), where A is a valid string.
 

Example 1:
Input: s = "lee(t(c)o)de)"
Output: "lee(t(c)o)de"
Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.

Example 2:
Input: s = "a)b(c)d"
Output: "ab(c)d"

Example 3:
Input: s = "))(("
Output: ""
Explanation: An empty string is also valid.

Example 4:
Input: s = "(a(b(c)d)"
Output: "a(b(c)d)"
*/

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        if s.count == 0 {
            return s
        }

        var stack: [String] = []
        var numOpen = 0
        var numClosed = 0

        // The logic has two main steps:
        // 1- We visit every character in the string and populate stack. However, when we encounter ")", we check if the 
        // number of opening brackets is greater than the no. of closing brackets. We add ")" to the stack only if this condition is satisfied.
        // 2- After stage 1, extra ")" from the string have been removed because we never added them to the stack. However, some "("
        // may have come after ")" in the string that need to be removed now. So in stage 2, we calculate the difference between
        // the no. of opening and closing brackets in stack, and remove all the extra "(" from the end of the stack till the 
        // no. of "(" and ")" is equal.
        for char in s {
            let strChar = "\(char)"
            
            if strChar == ")" {
                if numOpen > numClosed {
                    numClosed += 1
                    stack.append(strChar)
                } 
            } else if strChar == "(" {
                numOpen += 1
                stack.append(strChar)
            } else {
                stack.append(strChar)
            } 
        }
        

        if numOpen != numClosed {
            var diff = numOpen - numClosed
            while diff > 0 {
                if let lastIdx = stack.lastIndex(of: "(") {
                    stack.remove(at: lastIdx)
                    diff -= 1
                }
            }
        }

        return stack.joined(separator: "")
    }
}

let sol = Solution()
print(sol.minRemoveToMakeValid("())()((("))
