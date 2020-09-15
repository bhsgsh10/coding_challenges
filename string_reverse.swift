class Solution {
    func reverseString(_ s: inout [Character]) {
        if s.count <= 1 {
            return
        }
        
        var charI = 0
        // No need to run over the entire length. N/2 is sufficient
        while charI < s.count / 2 {
            let charC = s[charI]
            s[charI] = s[s.count - 1 - charI]
            s[s.count - 1 - charI] = charC
            
            charI += 1
        }
    }
}

let sol = Solution()
var array: [Character] = ["h","e","l","l","o"]
sol.reverseString(&array)
print(array)