class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        
        var isAna = true
        
        var sCharFreq: [Character: Int] = [:]
        
        for sChar in s {
            if sCharFreq[sChar] != nil {
                sCharFreq[sChar]! += 1
            } else {
                sCharFreq[sChar] = 1
            }
        }
        
        var tCharFreq: [Character: Int] = [:]
        for tChar in t {
            if tCharFreq[tChar] != nil {
                tCharFreq[tChar]! += 1
            } else {
                tCharFreq[tChar] = 1
            }
        }
        
        for tChar in t {
            if let freq: Int = sCharFreq[tChar],
                 tCharFreq[tChar]! == freq {
                continue
            } else {
                isAna = false
                break
            }
        }
        
        return isAna
    }
}

let sol = Solution()
let isAna = sol.isAnagram("anagram", "graname")
print(isAna)


