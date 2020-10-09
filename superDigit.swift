import Foundation
import Darwin

// Complete the superDigit function below.
func superDigit(n: String, k: Int) -> Int {

    if n.count == 1 && k == 1 {
        return Int(n) ?? 0
    }

    return calculateSum(n: n, k: k)
}

func calculateSum(n: String, k: Int) -> Int {

    if Double(n)! < 10 {
        return Int(n) ?? 0
    }
    var finalSum: Int = 0 

    var factor = Double(truncating: pow(10, n.count-1) as NSNumber)
    print(factor)
    var x = Double(n)!
    print(x)
    while factor > 0 && x > 0 {
        let num: Int = Int((x / factor).rounded(.towardZero))
        finalSum += num
        x = x.truncatingRemainder(dividingBy: factor)
        factor /= 10
    }

    finalSum = finalSum * k
    if finalSum > 10 {
        return calculateSum(n: "\(finalSum)", k: 1)
    } else {
        return finalSum
    }
}

print(superDigit(n: "3546630947312051453014172159647935984478824945973141333062252613718025688716704470547449723886626736", k: 100000))

//print(10 / 23)