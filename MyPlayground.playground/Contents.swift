// ### Simple Values

// Printing
print("Hello World")

// Variables
var myVariable = 10
let myConstant = 100
let myDouble: Double = 11.22

let myFloat: Float = 4

// Type Casting
let label = "The width is "
let width = 94

let widthLabel = label + String(width)
print(widthLabel)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// Big Strings
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

// Lists
var fruits = ["Apple", "Orange", "Kiwi"]
print(fruits[0])

fruits.append("Blueberry")

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

// Dicts
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
occupations["Jayne"] = "Public Relations"

// ### Control Flow

let individualScores: [Int] = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score >= 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print("Team Score: \(teamScore)")

// Optionals
// An optional value either contains a value or contains nil
var optionalString: String?
print(optionalString == nil)

var optionalName: String? = "Johnny Appleseed"
var greeting: String = "Hello!"
if let name = optionalName {    // This condition returns true because 'name' is successfully assigned
    greeting = "Hello, \(name)"
}

// The ?? operator assigns a default value if the optional is nil.
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)" // Prints nickname if it is assigned, fullname otherwise.

// Switches
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):                 // Pattern matching
        print("Is it a spicy \(x)?")
    default:                                                // Switch case must be exhaustive.
        print("Everything tastes good in soup.")
}

// For Each
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestType: String = "Unknown"
for (type, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largestType = type
            largest = number
        }
    }
}
print(largest)
print(largestType)

for i in 0...4 {    // ... can be replaced with ..< to omit the upper bound.
    print(i)
}

// While loops
// Condition can be at either the front or end of the loop. If it is at the end, the loop will always be run atleast once
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)


// ### Functions

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))

// That function uses its parameter names as labels, you can have different names and labels like such,
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

// functions can use tuples to return multiple values,
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2) // Values in tuples can be accessed by name or number.

// Nested functions have access to data in parent functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Functions can also return or take other functions as types.

// Closures
var numbers = [20, 19, 7, 12]
numbers = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(numbers)
// The brackets define an closure, like an unnamed function. The 'in' keyword separates the arguements and return type from the body.

numbers = numbers.map({ (number: Int) -> Int in
    if number % 2 == 0 {
        return number
    }
    return 0
})
print(numbers)

let mappedNumbers = numbers.map({ number in 3 * number })   // This is the same as before but omits infered information.
print(mappedNumbers)                                        // Single statement closures implicitly return the value of their only statement.


// ### Objects and Classes
class NamedShape {
    var numberOfSides = 0
    var name: String

    init(name: String) {
       self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    deinit {
        // This function provides cleanup before the object is deallocated
    }
}

// Creating and accessing classes
var myShape = NamedShape(name: "Septagon")
myShape.numberOfSides = 7
var shapeDescription = myShape.simpleDescription()

// Subclasses
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// Getters and Setters
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
             return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// ### Enums and Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let myAce = Rank.ace
let aceRawValue = myAce.rawValue
