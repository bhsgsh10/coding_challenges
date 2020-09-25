// Rotating a string

func rotateString(_  str: String, rotatedStr: String) -> Bool {

    guard str.count == rotatedStr.count else {
        return false
    }

    let combinedStr = str + str
    return combinedStr.contains(rotatedStr)
}

let str = "abcde"
print(rotateString(str, rotatedStr: "a"))

func findPangrams(_ str: String) -> Bool {

}