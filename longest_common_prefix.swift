class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty == true {
            return ""
        }

        if strs.count == 1 {
            return strs.first!
        }

        let firstStr: String = strs.first!
        let firstStrArr: [Character] = Array(firstStr)
        var prefixStr = ""

        for index in 0..<firstStrArr.count {
            var totalFound = 0
            for str in strs[1...] {
                let arrStr = Array(str)
                if index >= arrStr.count {
                    break
                } 
                if arrStr[index] == firstStrArr[index] {
                    totalFound += 1
                } else {
                    break
                }
            }
            if totalFound == strs.count - 1 {
                prefixStr += String(firstStrArr[index])
            } else {
                return prefixStr
            }
        }

        return prefixStr
    }
}

let sol = Solution()
let preFx = sol.longestCommonPrefix(["flower", "flow", "flight"])
print(preFx)