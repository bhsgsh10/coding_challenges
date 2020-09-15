/* Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1. */
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var charDict: [Character: Int] = [:]
        var index = -1
        s.forEach{ char in 
            if let freq = charDict[char] {
                charDict[char]! += 1
            } else {
                charDict[char] = 1
            }
        }
        
        for character in s {
            if charDict[character]! > 1 {
                index += 1
            } else {
                break
            }
        }
        
        return index
    }
}

