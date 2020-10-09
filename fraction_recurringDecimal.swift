/*:
Problem 166/Leetcode
Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
If the fractional part is repeating, enclose the repeating part in parentheses.
If multiple answers are possible, return any of them.

Example 1:

Input: numerator = 1, denominator = 2
Output: "0.5"
Example 2:

Input: numerator = 2, denominator = 1
Output: "2"
Example 3:

Input: numerator = 2, denominator = 3
Output: "0.(6)"
Example 4:

Input: numerator = 4, denominator = 333
Output: "0.(012)"
Example 5:

Input: numerator = 1, denominator = 5
Output: "0.2"
*/

class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 {
            return "0"
        }

        let absNum = abs(numerator)
        let absDenom = abs(denominator)

        let sign = ((numerator < 0) == (denominator < 0)) ? "" : "-"
        let fractionResult: Int = absNum / absDenom
        var fractionRemainder: Int = absNum % absDenom
        
        
        // The dictionary maintains the index of each remainder in the division process. This allows us to identify where the 
        // recurring sequence starts
        var dict: [Int: Int] = [:]
        var output:[String] = []

        output.append(sign)
        output.append("\(fractionResult)")

        if fractionRemainder == 0 {
            return output.joined(separator: "")
        } else {
            output.append(".")
            while fractionRemainder != 0 {
                if let index = dict[fractionRemainder] {
                    output.insert("(", at: index)
                    output.append(")")
                    break
                } else {
                    
                    dict[fractionRemainder] = output.count
                    fractionRemainder *= 10
                    output.append("\(fractionRemainder / absDenom)")
                    fractionRemainder = fractionRemainder % absDenom
                }
            }
        }
        
        return output.joined(separator: "")
    }
}

let sol = Solution()
print(sol.fractionToDecimal(-2147483648, 1))
