/*
Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid.
We define the validity of a string by these rules:

- Any left parenthesis '(' must have a corresponding right parenthesis ')'.
- Any right parenthesis ')' must have a corresponding left parenthesis '('.
- Left parenthesis '(' must go before the corresponding right parenthesis ')'.
'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
An empty string is also valid.


*/

class Solution {
    func checkValidString(_ s: String) -> Bool {

       var x = 0
       var y = 0
       for c in s {
           if c == "(" {
               x += 1; y += 1
           } else if c == ")" {
               x -= 1; y -= 1
           } else {
               x += 1; y -= 1
           }
           if x < 0 { return false }
           if y < 0 { y = 0 }
       }
       
       return y == 0
    }
}

let sol = Solution()
let str = "(*))"
print(sol.checkValidString(str))

// var arr = [4, 5, 6]
// arr = arr.filter {$0 > 10}
// print(arr.count)

/// ((((*))*)