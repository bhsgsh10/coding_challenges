/*:
## Given a string, return all possible permutations.

The following algorithm has a time complexity of O(n*n!), considering that String(<character array>) will take O(n) time and 
printing an array of strings is also O(n)
*/

func getPermutations(for s: String) -> [String]? {
    guard s.count > 0 else {return nil}
    guard s.count > 1 else {return [s]}

    func permuteString(_ s: inout [Character], _ leftIndex: Int, _ rightIndex: Int, _ strs: inout [String]) {
        print(leftIndex, rightIndex)
        
        if leftIndex == rightIndex {
            strs.append(String(s))
        } else {
            for i in leftIndex...rightIndex {
                
                s.swapAt(leftIndex, i)
                permuteString(&s, leftIndex+1, rightIndex, &strs)
                //Swapping back to original position -> Backtracking
                s.swapAt(leftIndex, i)
            }
        }
    }

    var chars = [Character](s)
    print(chars)
    var finalStrings: [String] = []
    permuteString(&chars, 0, chars.count - 1, &finalStrings)
    return finalStrings
}

let str = "ABC"
print(getPermutations(for: str) ?? "")
