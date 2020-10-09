/*
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

 Example 1:

 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 Example 2:

 Input: s = "3[a2[c]]"
 Output: "accaccacc"
 Example 3:

 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"
 Example 4:

 Input: s = "abc3[cd]xyz"
 Output: "abccdcdcdxyz"
 
 [Problem link](https://leetcode.com/problems/decode-string/)
 
 */

/// The solution maintains two stacks - one for numbers and the other for characters. Since digits are only to indicate repititons we don't have to check for cases
/// where a digit could be part of the string, so whenever we encounter a nuumber in the string it can safely be put in the numbers stack without checking any other condition. Also brackets are assumed to be well formed, so we don't have to check for the validity of parentheses.


import Foundation

class Solution {
    func decodeString(_ s: String) -> String {
        guard !s.isEmpty else {return s}
        
        var finalStr = ""
        let sArr = Array(s)
        var index = 0
        var numArg = ""
        var numStack: [Int] = []
        var letterStack: [String] = []
        while index < sArr.count {
            let char = sArr[index]
            if char == "[" {
                numStack.append(Int(numArg)!)
                letterStack.append("")
                numArg = ""
            } else if char == "]" {
                var num = -1000
                if !numStack.isEmpty {
                    num = numStack.removeLast()
                }
                var letters = ""
                if !letterStack.isEmpty {
                    letters = letterStack.removeLast()
                }
            
                if num > 0 {
                    letters = String(repeating: letters, count: num)
                }
                if letterStack.count > 0 {
                    letterStack[letterStack.count - 1] += letters
                } else {
                    letterStack.append(letters)
                }
                
            } else if char.isNumber {
                numArg += "\(char)"
            } else {
                
                switch letterStack.count {
                case 0:
                    letterStack.append("\(char)")
                    break
                default:
                    letterStack[letterStack.count - 1] += "\(char)"
                    break
                }
            }
            index += 1
        }
        
        finalStr = letterStack.joined(separator: "")
        
        return finalStr
        
    }
}

let sol = Solution()
print(sol.decodeString("3[a]2[bc]"))
