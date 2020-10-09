/*
Write a program to print all suubstrings of a given string
*/

func allSubstrings(_ s: String) -> [String]? {
    guard s.count > 0 else {
        return []
    }

    guard s.count > 1 else {
        return [s]
    }

    let chars = [Character](s)
    var substrings: [String] = []
    for i in 0..<chars.count { // decides the length of the substring
        for j in 0..<chars.count { // decides the starting point of the substring
            let uptoIndex = j + i
            if uptoIndex < chars.count {
                let substring = String(Array(chars[j...uptoIndex]))
                substrings.append(substring)
            }
        }
    }

    return substrings
}


let string = "abcd"
print(allSubstrings(string))