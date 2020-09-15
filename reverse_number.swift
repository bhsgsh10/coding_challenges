import Darwin

class Solution {
    func reverse(_ x: Int) -> Int {

        let contains = -pow(2, 31)...(pow(2, 31) - 1) ~= Float(x)
        if contains == false {
            return 0
        }


        var strX = String(x)
        var addSign = false
        if strX.prefix(1) == "-" {
            addSign = true
            strX.remove(at: strX.startIndex)
        }



        strX = String(strX.reversed())
        print(strX)
        
        if strX.prefix(1) == "0" {
            strX.remove(at: strX.startIndex)
        }
        if addSign == true {
            strX.insert("-", at: strX.startIndex)
        }

        let finalNum = Int(strX) ?? x

        
        
        return finalNum
    }
}

let sol = Solution()
let num = 1534236469
let reversedNum = sol.reverse(num)
print(reversedNum)
