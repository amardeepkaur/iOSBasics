let minValue = UInt.min
let maxValue = UInt.max

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwardA(s1: String, s2: String) -> Bool {
    return s1 > s2
}

//Closure:
var reversedNames = names.sorted(by: backwardA)
print(reversedNames)

var r1 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

var r11 = names.sorted(by: { s1, s2 in return s1 > s2 })

r1 = names.sorted(by: { s1, s2 in s1 > s2 })

r1 = names.sorted(by: { $0 > $1 })

//Trailing closure: when a closure expression is passed as a param and closure is long.
func someFuncAcceptsClosure(closure: () -> () ) {
    // Function body
}

someFuncAcceptsClosure(closure: {
    //closure body
})
//OR
someFuncAcceptsClosure {
    //closure body
}

r1 = names.sorted() { $0 > $1 }

class MyClass {
    var myProperty: Int = 0 {
        willSet {
            print("Will set to \(newValue)")
        }
        didSet {
            print("Did set from \(oldValue) to \(myProperty)")
        }
    }
    init() {
//        defer { myProperty = 1 }
        myProperty = 2
    }
}
let instance = MyClass()
instance.myProperty = 3

/*
 if, guard, switch: to execute different branches of code
 break, continue: to transfer the flow of execution to another point of code
 defer: wrap code to be executed when leaving the current execution
 
 where in switch: bound to temporary constants or variables for use within the case’s body
 
 while: evaluates its condition at the start of each pass through the loop.
 repeat-while: evaluates its condition at the end of each pass through the loop.
 
 fallthrough: allows controls to transfer to the next case statement regardless of whether the current case’s condition is matched
 
 Defer: * You use a defer block to write code that will be executed later, when your program reaches the end of the current scope
    * guarantee a pair of actions happen —
        like manually allocating and freeing memory,
        opening and closing low-level file descriptors
        beginning and ending transactions in a databas - because you can write both actions next to each other in your code
    * If you write more than one defer block in the same scope, the first one you specify is the last one to run.
    * If your program stops running — for example, because of a runtime error or a crash — deferred code doesn’t execute. However, deferred code does execute after an error is thrown; for information about using defer with error handling
 
 https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow#Fallthrough
 
 compound cases: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow#Compound-Cases
 
 var mathFunction: (Int, Int) -> Int = addTwoInts
func mathFunction(Int, Int) -> Int {}
 
func sessionCompletion(completionHandler(success: Any, failure: Any)->(), value: Int) {}
 
 In-Out Parameters: Function parameters are constants by default. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.
 
 func swap(a: inout Int, b: inout Int) { }
 swap(&a, &b)

 Closure:
    * group of code that executes together without creating a named func
    * can capture and store references to any constants and variables from the context in which they're defined. Swift handles all of the memory management of capturing for you.
 Syntax: { (<#<#parameters#>>) -> <#return type#> in
 <#statements#>
}
 
 param can be: inout, variadic, tuples. But cannot have default value
 
 Completion handlers can become hard to read, especially when you have to nest multiple handlers. An alternate approach is to use asynchronous code, as described in Concurrency. 
 */


