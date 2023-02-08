#  MVVM and the Swift type-system

TODO: Change movie to a class?

## MVVM
Three Actors:
    - View 
    - Model (The one and only source of truth)
    - ViewModel (Communicates user intent to the model and model changes to the view.)
    
## Swift Types

- struct
- class
- protocal 
- generics
- enum
- function


ViewModel is a class
View, Identifiable is a protocal
A model could be a bunch of small models. combined by one view model.

### Struct and Class
Both have stored variables.
Both have computed variables. (aka. var body: some View {})
Both can have functions
Both have initializers (init)

Struct are value types (copied when passed around)
Classes are reference types. they live in the heap (pointers are passed around)

Classes are automatically referenced counted. Clears memory when count reaches zero. (Opposed to garbage or dealloc())
Structs don't have inheretance. Classes have single inheritance

Struct "free" init initializes all vars (unless you gave it a default value.)
Class "free" init initializes no vars
Giving a custom init removes the "free init"

Struct mutability must be bade explicity (var vs. let)
Classes only have vars and no lets

Struct is "go to" structure, use classes when sharing things.
Functional vs OOP (look into differences)

### Generics ("Don't Cares")
Something with an unknown type. 
Array is the worlds simplies to understand generic.
It has a bunch of different things and doesn't care what they are.


### Functions as Types
A parameter can be of type "function"
Passing functions to other functions is the heart of functional programming.
(Int, Int) -> Bool
(Doube) -> Void
() -> Array<String>
() -> Void

var food: (Double) -> Void // type: a function that takes a Double and returns nothing.

#### Closures
Inlined functions are called "closures"
