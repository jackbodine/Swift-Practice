#  Lecture 4 Notes

## Enum
a structure that can be one of multiple states and with associated data

enum FastFoodMenuItem {
    case hamburger(numberOfPatties: Int)
    case fries(size: FryOrderSize)
    case drink(String, ounces: Int)
    case cookie
}

enum FryOrderSize {
    case large
    case small
}

let menuItem: FastFoodMenuItem = FastFoodMenuItem.hamburger(patties: 2)
"FastFoodMenuItem" can be left off of one side but not both.

switch menuItem {
    case .hamburger: print("burger")
    case .fries(let size): print("a \(size) order of fries!")
    case .drink: break                  // wont do anything
    case .cookie: print("cookie")
    default: print("other")             // catches all other cases.
}

let s: String = "hello"
switch s {
    case "Hello": *Something*
    case "Goodbye": *Something*
    default: print("Error")
}

** You can put functions or variables inside of enums but I left that out for now.**

## Optionals
Actually an enum. Period, nothing more

enum Optional<T> {
    case none
    case some(T)
}

Use it anytime we have a value that could be "undetermined" or "not set"

var hello: String? = nil    var hello: Optional<String> = .none
var hello: String? = nil    var hello: Optional<String> = .none
var hello: String? = "hello"    var hello: Optional<String> = .some("hello")

print(hello!)   // force unwrapping. Will crash if nil. 

if let safehello = hello {
    print(safehello)
} else {
    // do something else
}

?? - Nil-coalescing operator
let y = x ?? "foo"         // if its nil, use "foo", if it exists, use it.




