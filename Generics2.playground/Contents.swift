import UIKit
import Foundation

// Using Generics to swap values of any type, given the given values are of the same type
func swapValues<X>(_ a: inout X, _ b: inout X) {
    let temp = a
    a = b
    b = temp
}

var a = 10
var b = 90


swapValues(&a, &b)
a
b

// Can use Any type to swap values of different types
func swapAny(_ a: inout Any, _ b: inout Any) {
    let temp = a
    a = b
    b = temp
}

var x: Any = 90
var y: Any = "Bhaskar"

swapAny(&x, &y)
x
y

// Defining a Int Stack struct
struct Stack {
    var items = [Int]()
    mutating func push(_ num: Int) {
        items.append(num)
    }
    
    mutating func pop() -> Int? {
        if items.count > 0 {
            return items.removeLast()
        }
        return nil
    }
}

//Defining a Generic Stack
struct GenericStack<Element> {
    var items: [Element] = [Element]()
    mutating func push(_ element: Element) {
        items.append(element)
    }
    
    mutating func pop() -> Element? {
        return items.removeLast()
    }
}

var stackStrings = GenericStack<String>()
stackStrings.push("Bhaskar")
stackStrings.push("Chelsea")
stackStrings.pop()


func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

class Subject: Equatable {
  let id: String
  let name: String
  let occupation: String
  
  init(id: String, name: String, occupation: String) {
    self.id = id
    self.name = name
    self.occupation = occupation
  }
}

func ==<T: Subject>(lhs: T, rhs: T) -> Bool {
  return lhs.id == rhs.id
}


