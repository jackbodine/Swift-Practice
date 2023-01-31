//: [Previous](@previous)

import Foundation

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

// String Delimiter (#) includes all special characters, without envoking their effects
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

let emptyString = ""

if emptyString.isEmpty {
    print("Nothing to see here")
}

var longString = "H"
longString += "ello"

// Iterate through characters
for character in "Dog!🐶" {
    print(character)
}

// Character type
let exclamationMark: Character = "!"

// String interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// Count property
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

// Accessing and Modifying strings
// Swift strings cannot be indexed by integer values

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

// Inserting
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

//: [Next](@next)
