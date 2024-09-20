# iOSBasics
Cover different topics

iOS Topics

- Swift
- Design Patterns
 - MVVM
 - Protocol Oriented Programming
- Core Data
- Testing
- Crashylytics/Diagnostics
- Instruments
- DevOps
- Github
- Agile

 *** 
 - === (Identity operator)
   - Compare reference type objects e.g. classes
   - Checks if two objects share the same memory address.
 - Equatable
   - ```static func != (Self, Self) -> Bool```  Returns a Boolean value indicating whether two values are not equal.
   - ``` static func == (Self, Self) -> Bool ``` Returns a Boolean value indicating whether two values are equal.
   - Types are both equatable and hashable, including strings, integers, floating-point values, Boolean values, and collections of equatable and hashable types.
   - For automatic confirmation to the equtable and hashable protocol:
      - For a structure, all its stored properties must conform to Equatable and Hashable.
      - For an enumeration, all its associated values must conform to Equatable and Hashable. (Enumerations without associated values have Equatable and Hashable conformance even without declaring adoption.)
- Hashable
  - An instance of a hashable type can reduce its value mathematically to a single integer, which is used internally by sets and dictionaries to make lookups consistently fast.
  - https://developer.apple.com/documentation/swift/adopting-common-protocols 
- Associated Values
   -  store values of other types alongside these case values. This additional information is called an associated value, and it varies each time you use that case as a value in your code.
 
     ```
     enum Barcode {
       case upc(Int, Int, Int, Int)
      case qrCode(String)
     }
    ```
     ``` var productBarcode = Barcode.upc(8, 85909, 51226, 3)  ```
  
     ``` productBarcode = .qrCode("ABCDEFGHIJKLMNOP") ```


- CustomStringConvertible protocol and add description property to the object.
  ```
  struct Device : CustomStringConvertible {
   var type: String
   var price: Float
   var color: String
  
   var description: String {
    return "Type: \(type), Price: \(price), Color: \(color)"
   }
   ```
  - Print statement will be much cleaner <br> 
   ``` [Type: iPhone, Price: 799.0, Color: White, Type: iPhone, Price: 699.0, Color: Black] ```

<br>

*** 

1. Check in Swift if two arrays contain the same elements regardless of the order in which those elements appear in?
	  ```
	   var array1 = ["a", "b", "c"]
	   var array2 = ["b", "c", "a"]
	   I'd like the result of the comparison of these two arrays to be true, and the following...
	   var array1 = ["a", "b", "c"]
	   var array2 = ["b", "c", "a", "d"]
	   ...to be false. 
	   extension Array where Element: Comparable {
	      func containsSameElements(as other: [Element]) -> Bool {
	          return self.count == other.count && self.sorted() == other.sorted()
	      }
	   }
	   // usage
	   let a: [Int] = [1, 2, 3, 3, 3]
	   let b: [Int] = [1, 3, 3, 3, 2]
	   let c: [Int] = [1, 2, 2, 3, 3, 3]
	 ```

  ``` print(a.containsSameElements(as: b)) ``` // true <br>
  ``` print(a.containsSameElements(as: c)) ``` // false
    

2. How to compare two arrays. What if you create a copy of an array and update only one? What will be the count for both?
	```
	   class Test {
	      var firstArr = [1,2,3]
	      var secondArr = [1,2,3]
	      func performTask() {
	          firstArr == secondArr ? print("true") : print("False")
	      }
	   }
	    
	   let test = Test()
	   test.performTask()
	    
	   var firstArr = [1,2,3]
	   var secondArr = [1,2,3,4]
	    
	   var newArr = firstArr
	   newArr.append(5)
	   print(firstArr) // [1,2,3]
	   print(newArr) //Output [1,2,3,5]
 	```
   - Array in swift is value type and it creates a new copy. Original one does not change.
    
3. Equatable protocol in Swift. Compare to model instances using Equatable and Generics.
    
   https://betterprogramming.pub/swifts-equatable-and-comparable-protocols-54811114a5cf

   ``` 
	   struct Dog: Equatable {
	   let name: String
	   let age: Int
	   let parent: Bool
	   }
	    
	   let millie = Dog(name: "Millie", age: 5, parent: false)
	   let bear = Dog(name: "Bear", age: 5, parent: true)
	    
	   millie == bear //Returns true
    ```
4. Static keyword
      - By declaring properties and methods as Static, Swift allocates them directly into the object’s memory, making it available for use without the need of an instance.
      - The Static keyword makes it easier to utilize an objects properties or methods without the need of managing instances. Use of the Static keyword in the Singleton pattern can reduce memory leaks by mismanaging instances of classes.
    
5. Compare class
   ```
	   class Person {
	      var name = "Jay"
	   }
	    
	   class Animal {
	      var name = "Cat"
	   }
	    
	   let p = Person()
	   let a = Animal()
	    
	   print(p === a)
	```
 ******
