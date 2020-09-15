func hashMap(queryType: [String], query: [[Int]]) -> Int64 {
    if queryType.count == 0 {
        return 0
    }
    
    var map: [Int: Int] = [:]
    
    var index = 0
    var total = 0
    while index < queryType.count {
        let queryName = queryType[index]
        let queryElement = query[index]
        if queryName == "insert" {
            map[queryElement[0]] = queryElement[1]
        } else if queryName == "addToValue" {
            map.keys.forEach {map[$0]! += queryElement[0]}
        } else if queryName == "addToKey" {
            _ = map.map { 
                $0.key + queryElement[0]
            }
        } else if queryName == "get" {
            total += map[queryElement[0]] ?? 0
        }
        
        index += 1
    }
    return Int64(total)
}

var dict: [Int: Int] = [2: 4, 3: 7]
var newDict: [Int: Int] = [:]
for (key, value) in dict{
    newDict[key+2] = value
}
dict = newDict

dict = dict.mapValues {value in 
            return value + 2
            }
print(dict)

let numbers: [Int] = []
let numberSum = numbers.reduce(0, { x, y in
    x + y
})

print(numberSum)

/*You are implementing your own programming language and you've decided to add support for merging strings. A typical merge function would take two strings s1 and s2, and return the lexicographically smallest result that can be obtained by placing the symbols of s2 between the symbols of s1 in such a way that maintains the relative order of the characters in each string.

For example, if s1 = "super" and s2 = "tower", the result should be merge(s1, s2) = "stouperwer".

print(hashMap(queryType: ["insert", "insert", "addToValue", "addToKey", "get"], query: [[1,2], [2,3], [2], [1], [3]]))

You'd like to make your language more unique, so for your merge function, instead of comparing the characters in the usual lexicographical order, you'll compare them based on how many times they occur in their respective strings (fewer occurrences means the character is considered smaller). If the number of occurrences are equal, then the characters should be compared in the usual way. If both number of occurences and characters are equal, you should take the characters from the first string to the result.

Given two strings s1 and s2, return the result of the special merge function you are implementing.

Example

For s1 = "dce" and s2 = "cccbd", the output should be
mergeStrings(s1, s2) = "dcecccbd".
All symbols from s1 goes first, because all of them have only 1 occurrence in s1 and c has 3 occurrences in s2.

For s1 = "super" and s2 = "tower", the output should be
mergeStrings(s1, s2) = "stouperwer".
Because in both strings all symbols occur only 1 time, strings are merged as usual. You can find explanation for this example on the image in the description. */
