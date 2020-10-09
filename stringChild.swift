/*
https://www.hackerrank.com/challenges/common-child/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=strings
*/


func commonChild(s1: String, s2: String) -> Int {
    var s1Index = 0

    let s1Arr = Array(s1)
    let s2Arr = Array(s2)
    var maxLength = 0
    var finalStr = ""
    var mis2 = 0
    while mis2 < s2Arr.count {
        var mis1 = s1Index
        while mis1 < s1Arr.count {
            if s1Arr[mis1] == s2Arr[mis2] {
                finalStr += String(s1Arr[mis1])
                maxLength += 1
                s1Index = mis1 + 1
                break
            }
            else {
                mis1 += 1
            }
        }
        mis2 += 1
    }
    print(finalStr)
    return maxLength
}

let str1 = "WEWOUCUIDGCGTRMEZEPXZFEJWISRSBBSYXAYDFEJJDLEBVHHKS"
let str2 = "FDAGCXGKCTKWNECHMRXZWMLRYUCOCZHJRRJBOAJOQJZZVUYXIC"
print(commonChild(s1: str1, s2: str2))