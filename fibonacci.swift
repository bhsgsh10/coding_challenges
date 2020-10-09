/*
The following implementation covers finding fibonacci number for given value of n using pure recursion and then using dynamic
programming to illustrate how the process can be made faster.
*/

func fibonacci(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }

    return fibonacci(n-1) + fibonacci(n-2)
}

let n = 10
// let fibonacciN = fibonacci(n)

// print(fibonacciN)

// Now we'll implement the same functionality using memoization
func fibonacciUsingMemo(_ n: Int) -> Int {
    var memo: [Int: Int?] = [:]
    for i in 0...n {
        memo[i] = nil
    }
    
    if memo[n] == nil {
        if n <= 1 {
            memo[n] = n
        } else {
            memo[n] = fibonacciUsingMemo(n-1) + fibonacciUsingMemo(n-2)
        }   
    } 

    return memo[n]! ?? 0
}

// let memoN = fibonacciUsingMemo(n)
// print(memoN)


// Now we'll implement the same problem using a table. This works by entering the base values (n=0 and n=1 in this case)
// into the table, and then utlizing them to fill up the fibonacci values of the remaining values leading up to n
// Note that tabulation approach does not use recursion and uses loops instead.

/* Tabulation approach always solves all the subproblems, whereas memoization solves subproblems on demand. Thus the latter 
can save more time while computing results */
func fibonacciLookup(_ n: Int) -> Int {
    var table: [Int: Int] = [:]
    table[0] = 0
    table[1] = 1

    if n > 1 {
        for i in 2...n {
            table[i] = table[i-1]! + table[i-2]!
        }
    }

    return table[n]!
}

let lookupN = fibonacciLookup(10)
print(lookupN)


// Program for Longest Common Subsequence (LCS)
// If the last characters match, LCS[i][j] = LCS[i-1][j-1] + 1 else
// LCS[i][j] = max(LCS[i-1][j], LCS[i][j-1])

func lcs(_ x: [Character], _ y: [Character]) -> String {

    var finalString: [Character] = []

    if x.count == 0 || y.count == 0 {
        return ""
    }


    let m = x.count
    let n = y.count

    // Create lcsTable of size (m+1)*(n+1) filled with 0s.
    var lcsTable: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m+1)
    for i in 1...m { // starting the loop from 1 as the first row and column for the lcsTable will always be zeros
        for j in 1...n { // the size of the table is (m+1)*(n+1) because the first row and first column are zeros.
            if x[i-1] == y[j-1] { // using i-1 and j-1 here because the character comparison will go from 0 to m-1 and from 0 to n-1
                lcsTable[i][j] = lcsTable[i-1][j-1] + 1
            } else {
                lcsTable[i][j] = max(lcsTable[i-1][j], lcsTable[i][j-1])
            }
        }
    }

    // Traverse the 2D array starting from L[m][n]. Do following for every cell L[i][j]
    // …..a) If characters (in X and Y) corresponding to L[i][j] are same (Or X[i-1] == Y[j-1]), then include this character as part of LCS.
    // …..b) Else compare values of L[i-1][j] and L[i][j-1] and go in direction of greater value.
    var i = m
    var j = n
    while i > 0 {
        while j > 0 {
            if x[i-1] == y[j-1] {
                finalString.append(x[i-1])
                i -= 1
                j -= 1
            } else if lcsTable[i-1][j] > lcsTable[i][j-1] {
                i -= 1
            } else {
                j -= 1
            }
        }
    }

    return String(finalString.reversed())
}

let x = "ABCD"
let y = "ABC"

let charsX = [Character](x)
let charsY = [Character](y)

print(lcs(charsX, charsY))