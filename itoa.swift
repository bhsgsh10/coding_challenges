// Converting Integer to String in Swift

 func atoi(_ num: Int) -> String {
     var n = num
     var output = ""
     while n > 0 {
         let rem = n % 10
         output = "\(rem)" + output
         n = n / 10
     }

     return output
 }

 print(atoi(678))

var numbers: [Int] = [678, 908, 876, 456]
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let strings = numbers.map { (num) -> String in
    var n = num
    var output = ""
    while n > 0 {
        output = digitNames[n%10]! + output
        n /= 10
    }
    return output
}
 
print(strings)

let doubles = numbers.map { num in 
    return num * 2
}
print(doubles)
