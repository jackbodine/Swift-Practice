import UIKit

/**
 # Markdown Comments
 This is an example of a markdown comment.
 Swift markdown supports headers, *italics* and **bold.**
 */

/**
 # The Basics
 Swift supports the basic fundamental C types and three collection types: Array, Set and Dictionary.
 Swift also supports tuples, unlike C.
 Swift introduces optional types, which handle the absence of a value.
 */
let myInt: Int = 10
let myFloat: Float = 1.2
let myDoube: Double = 100
let myBool: Bool = true

// let denotes a constant, var denotes a variable.
// you can declare multiple constants or variables on the same line:

var x = 0.0, y = 0.0, z = 0.0
let red, green, blue: Float     // Type annotations follow the final variable name.

// variable names support almost any unicode character.
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"             // Cursed

// string interpolation
let friendlyWelcome = "Bonjour!"
print("The current value of friendlyWelcome is \(friendlyWelcome)")

let unsignedEightBitInt: UInt8  // you can choose certain sized ints but this is often unnessesary

// Numbers can be written in different bases with the following prefixes
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

// Type conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

// Type Aliases let you create a more appropriate alias for a type.
typealias AudioSample = UInt16
var maxAmplitudeFound: AudioSample = AudioSample.min    // This is an unsigned 16bit int

// Tuples can hold values of multiple types
let html404error = (404, "Not Found")  // Type: (int, string)

let (statusCode, _) = html404error  // decomposing a tuple
print("The status code is \(statusCode)")
print("The status message is \(html404error.1)")    // indexing a tuple

// Named tuple example
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// Optionals
// "You use optionals in situations where a value may be absent.
// An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all."
// the type Int?, means that the value is either an Int or nothing at all.
var serverResponce: Int? = 404
serverResponce = nil

let possibleNumber = 123
let convertedNumber: Int? = Int(possibleNumber)

if convertedNumber != nil {         // checks if an optional exists
    print("convertedNumber has an integer value of \(convertedNumber!).") // The exclamation point force unwraps the value.
}                                                                 // it should only be used when you are certain a value exists

// Optional binding
// Commented out because it doesn't compile
//if let actualNumber = Int(possibleNumber) { // This is true the optional exists
//    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
//} else {
//    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
//}

// Shorter Notation:
//let myNumber = Int(possibleNumber)
//if let myNumber {
//    print("My number is \(myNumber)")
//}
// Prints "My number is 123"

// Error Handling
func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

// Assertions and Preconditions
// These check if something is true, if it is your code continues normally, if it isn't your code will terminate.
// Unlike Errors, they cannot be caught.
// Assertions are only checked in debug builds. Preconditions are checked in debug and production.

assert(5 > 1)   // This is true so the code continues
print("Success!")
