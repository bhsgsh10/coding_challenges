func detectDuplicates2(input: String) -> Bool {
    return Set(input).count == input.count
}

assert(detectDuplicates2(input: "No duplicates") == true, "Challenge 1 failed")
assert(detectDuplicates2(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(detectDuplicates2(input: "AaBbCc") == true, "Challenge 1 failed")
assert(detectDuplicates2(input: "Hello, world") == false, "Challenge 1 failed")

print(detectDuplicates2(input: "Hello, world"))


