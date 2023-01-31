//: [Previous](@previous)

import Foundation

// Basic the basic operators from C are all supported
var a = 1 + 1
var b = 1 * 2
let c = 10 / 2
let d = 3 - 2
let e = 45 % 10 // called remainder not modulo in Swift because it supports negative numbers

// Compound Assignment Operators (These things:)
a += 1
b *= 2

// Comparison operators are standard
1 == 1
4 >= 2

// You can compare tuples of the same type and size. Compares values from left to right
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

// Ternary Conditional Operator
let question = true
let answer1 = 1
let answer2 = 0

question ? answer1 : answer2
//Shorthand for:
if question {
    answer1
} else {
    answer2
}

// Another example:
// rowHeight should be 50 points taller if it has a header, and 20 if it doesn't/
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90

// Nil-Coalescing Operator (a ?? b)
// Unwraps optional a if it contains a value, or returns b if a is nil.

let userDefinedColorName: String? = "green"
let defaultColorName = "gray"
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName isn't nil, so colorNameToUse is set to "green"

// Range Operators
// Closed range operator (a...b) is inclusive of a and b.
// Half open range operator (a..<b) doesn't include b. (Use for zero indexed stuff)
let names = ["Clark", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// One sided range operators
for name in names[2...] {   // Prints from index 2 until the end of the list.
    print(name)
}
for name in names[...2] {   // Prints from the beginning of the list to 2 (Includes 2)
    print(name)
}

// Logical operators (not !, and &&, or ||) are all standard
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}



//: [Next](@next)
