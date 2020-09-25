class Solution {
    func isValid(_ s: String) -> Bool {
        var bracketStack: [Character] = []
        let closingBrackets: [Character] = ["}", ")", "]"]
        for charS in s {
            let revSym = getInverseSymbol(charS)
            if closingBrackets.contains(charS) == true {
                if bracketStack.count > 0 && bracketStack.last! == revSym {
                    bracketStack.removeLast()
                    continue
                } else {
                    return false
                }
            }
            
            bracketStack.append(charS)
        }
            
        return bracketStack.count == 0
    }

    func getInverseSymbol(_ c: Character) -> Character {

        switch c {
        case "}":
            return "{"
        case "]":
            return "["
        case ")":
            return "("
        default:
            return Character("X")
        }
    }
}

let sol = Solution()
print(sol.isValid("{[]}"))
