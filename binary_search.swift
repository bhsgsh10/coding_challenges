// Return the index in the array, of the desired value
// If the value can't be found, return nil
func binarySearch(_ array: [Int], value: Int) -> Int? {
    // Your code goes here
    var startIndex = 0
    var endIndex = array.count - 1
    
    while startIndex <= endIndex {
        let mid = (startIndex + endIndex) / 2
        if array[mid] < value {
            print("Increasing start Index")
            startIndex = mid + 1
        } else if array[mid] > value {
            endIndex = mid - 1
        } else {
            return mid
        }
    }
    return nil
}

// Test cases
let testArray = [1, 3, 9, 11, 15, 19, 29]
let testVal1 = 25
let testVal2 = 15
print(binarySearch(testArray, value: testVal1) ?? "not found") // Should be nil
print(binarySearch(testArray, value: testVal2)!) // Should be 4
