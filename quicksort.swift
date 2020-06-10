/*
An implementation of Quicksort in Swift

Note: 
1. Quicksort should not be used if we know that the array is more or less sorted. In that case, other sorting algorithms
like Merge sort will yield a better runtime.
2. Normal Quicksort algorithm  starts with taking the last element of the array to be the pivot element, which is why the runtime
can suffer, if the array is more or less sorted and the pivot is already at the correct position. Runtime may go as high as O(n^2)
3. A better approach is Randomized quicksort, that chooses the pivot element randomly, hence resulting in a better average
runtime of O(nlogn)
*/

/// Randomized Quicksort

func partition(_ array: inout [Int], _ start: Int, _ end: Int) -> Int {

    let x: Int = array[end]
    var i: Int = start - 1
    for index in start ... end - 1 {
        if array[index] <= x {
            i += 1
            array.swapAt(i,index)
        }
    }

    array.swapAt(i + 1, end)
    return i + 1
}

func randomizedPartitioning(_ array: inout [Int], _ start: Int, _ end: Int) -> Int {

    let randomIndex = Int.random(in: start ... end - 1)

    array.swapAt(end, randomIndex)
    
    return partition(&array, start, end)
}

func randomizedQuicksort(_ array: [Int], _ start: Int, _ end: Int) -> [Int] {

    var result = array
    if start < end {
        let pivotIndex = randomizedPartitioning(&result, start, end)
        result = randomizedQuicksort(result, start, pivotIndex - 1)
        result = randomizedQuicksort(result, pivotIndex + 1, end)
    }

    return result
}

var array = [67, 89, 4, 12, 120, 88, 88, 19]
let sortedArr = randomizedQuicksort(array, 0, 7)
print(sortedArr)

/*
ALTERNATIVE APPROACH
*/

// func quicksort(_ input: [Int], low: Int, high: Int) -> [Int] {

//     var result = input

//     if low < high {
//         let pivot = result[high]
//         var i = low

//         for j in low ..< high {
//             if result[j] <= pivot {
//                 (result[i], result[j]) = (result[j], result[i])
//                 i = i + 1
//             }
//         }
//         (result[i], result[high]) = (result[high], result[i])
//         result = quicksort(result, low: low + 1, high: i - 1)
//         result = quicksort(result, low: i + 1, high: high)
//     }

//     return result
// }

// var array = [67, 89, 4, 12, 120, 88, 88, 19]
// print(quicksort(array, low: 0, high: array.count - 1))



