class Solution {
    func decodeString(_ s: String) -> String {
    
        var finalStr = ""

        let initialStrArr = Array(s)
        var charsToRepeat = 0
        var i = 0
        while i < initialStrArr.count {
            var contiguousNumberStr = ""
            var contiguousRepeatStr = ""
            if initialStrArr[i].isLetter == true {
                finalStr.append(initialStrArr[i])
                i += 1
            } else if initialStrArr[i].isNumber == true {
                contiguousNumberStr.append(initialStrArr[i])
                for j in i+1..<initialStrArr.count {
                    if initialStrArr[j].isNumber == true {
                        contiguousNumberStr.append(initialStrArr[j])
                    } else {
                        i = j
                        break
                    }
                }
                charsToRepeat = Int(contiguousNumberStr) ?? 0
            } else if initialStrArr[i] == "[" {
                for j in i+1..<initialStrArr.count {
                    let charAtJ = initialStrArr[j]
                    if charAtJ.isLetter == true {
                        contiguousRepeatStr.append(initialStrArr[j])
                    } else {
                        i = j
                        break
                    }
                }
            } else {
                i += 1
            }
            if contiguousRepeatStr.count > 0 {
                var repeatedString = String(repeating: contiguousRepeatStr, count: charsToRepeat)
                finalStr += repeatedString
            }
        }
        
        return finalStr
    }
}


class Solution {
    func decodeString(_ s: String) -> String {

        var finalStr = ""
        var strArr = Array(s)
        for i in 0..<strArr.count {
            if strArr[i].isLetter {
                finalStr.append(strArr[i])
            } else if strArr[i].isNumber {

            }
        }

    }
    
    func recurseTillEndBracket(_ s: [Character]) -> String {
        var accumulatedStr = ""
        for charS in s {
            if charS != "]" {
                return accumulatedStr
            } else {
                
            }
        }
    }
}
let sol = Solution()
print(sol.decodeString("2[abc]3[cd]ef"))

