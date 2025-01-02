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

- Class and structs 

Summary of Memory Storage Behavior:
* Classes (Reference Types):
    * Heap allocation.
    * Reference counting via ARC.
    * Multiple references point to the same instance.
    * Can be shared and modified across different parts of the program.
* Structs (Value Types):
    * Stack allocation (typically).
    * No reference counting.
    * Each instance is copied when assigned or passed, creating independent copies.
    * More efficient for data that doesn’t need to be shared.

- Memory: Class and Structs
In Swift, **classes** and **structs** are two fundamental types that are used to model objects and data. Although they can often appear similar, they differ significantly in terms of **memory storage** and behavior, particularly when it comes to how instances of each type are stored and managed.

### Memory Storage: Classes vs. Structs

1. **Classes (Reference Types)**  
   Classes are **reference types**, meaning that when an instance of a class is assigned to a variable or passed to a function, **only the reference (or pointer) to the object** is copied, not the object itself. This means all variables pointing to that class instance refer to the same memory location, and changes made to one reference affect all other references.

   - **Memory Storage for Classes:**
     - **Heap Allocation**: Class instances are allocated on the **heap**. The heap is a region of memory where objects are stored and managed dynamically.
     - **Reference Counting**: Swift uses **Automatic Reference Counting (ARC)** to manage the memory of class instances. This means the instance's memory is freed automatically when there are no more references to it. Each reference to a class instance keeps track of how many references exist to that instance.
   
   - **Example:**
     ```swift
     class Person {
         var name: String
         init(name: String) {
             self.name = name
         }
     }

     var person1 = Person(name: "Alice")
     var person2 = person1  // person2 points to the same instance as person1
     person2.name = "Bob"
     print(person1.name)  // Output: Bob
     ```
     - Both `person1` and `person2` refer to the **same object** in memory on the heap, so modifying the object via one reference affects both.

2. **Structs (Value Types)**  
   Structs are **value types**, meaning that when an instance of a struct is assigned to a variable or passed to a function, **a copy of the entire value** is made. Each instance of the struct is independent, and changes to one instance do not affect the others.

   - **Memory Storage for Structs:**
     - **Stack Allocation**: Structs are typically stored on the **stack**. The stack is a region of memory that stores data in a last-in, first-out (LIFO) order. Each time a new function or block of code is executed, data is pushed onto the stack and popped off when the scope is exited.
     - **No Reference Counting**: Since structs are value types, Swift does not need to use reference counting or ARC. Memory is automatically managed when the struct goes out of scope.

   - **Example:**
     ```swift
     struct Person {
         var name: String
     }

     var person1 = Person(name: "Alice")
     var person2 = person1  // person2 is a copy of person1
     person2.name = "Bob"
     print(person1.name)  // Output: Alice (person1 is unaffected)
     ```
     - Here, `person2` is a **copy** of `person1`. The two structs are stored independently in memory, so modifying `person2` does not affect `person1`.

---

### Detailed Comparison of Memory Storage

| **Aspect**                        | **Classes (Reference Types)**                    | **Structs (Value Types)**                        |
|-----------------------------------|--------------------------------------------------|--------------------------------------------------|
| **Memory Location**               | Stored in the **heap** (dynamic memory).         | Stored on the **stack** (static memory).         |
| **Allocation**                    | Allocated dynamically at runtime.                | Allocated at compile-time, in a linear order.    |
| **Copying Behavior**              | **Reference** is copied (not the object itself). | **The entire value** is copied (deep copy).     |
| **Memory Management**             | Managed by **ARC** (Automatic Reference Counting). | Managed automatically by scope (stack memory).   |
| **Deallocation**                  | Freed when reference count drops to zero.        | Freed automatically when it goes out of scope.   |
| **Independence**                  | Multiple references point to the same object.    | Each instance is independent.                   |
| **Example Types**                 | `class`, `closure`, `String`, `Array`, etc.      | `struct`, `enum`, `Tuple`, `Int`, `Double`, etc. |
| **Performance Impact**            | Can be more memory-intensive due to heap allocation and reference counting overhead. | More efficient in cases where copies are not needed, as data is stored directly in variables. |

### Stack vs. Heap Memory

1. **Heap Memory (Classes):**
   - Heap memory is used for storing objects that need to be accessed and shared in multiple places.
   - Because heap memory is dynamically allocated, the lifetime of objects is controlled by reference counting (ARC). As long as there is at least one reference to an object, it remains in memory.
   - The downside is that heap allocation is **slower** than stack allocation because it involves managing dynamic memory.

2. **Stack Memory (Structs):**
   - Stack memory is used for smaller, temporary data that can be **automatically deallocated** when it goes out of scope.
   - Structs, being value types, are stored on the stack. When a struct is created, it is placed on the stack, and when the function or scope it belongs to ends, it is automatically removed from the stack.
   - Stack allocation is generally **faster** because it involves a simple **push** and **pop** operation, without needing to manage complex memory for the object.

---

### Summary of Memory Storage Behavior:

- **Classes (Reference Types)**:
  - **Heap** allocation.
  - **Reference counting** via ARC.
  - Multiple references point to the same instance.
  - Can be shared and modified across different parts of the program.
  
- **Structs (Value Types)**:
  - **Stack** allocation (typically).
  - No reference counting.
  - Each instance is copied when assigned or passed, creating independent copies.
  - More efficient for data that doesn’t need to be shared.

Understanding how **classes** and **structs** are stored in memory is crucial for choosing the appropriate type based on performance needs and how you want data to behave when copied or modified in your application.



- Shallow and deep copy
In programming, **deep copy** and **shallow copy** refer to how objects or data structures are duplicated when copied. The key difference between them lies in how the **nested objects** or **referenced data** are handled.

### Shallow Copy

A **shallow copy** creates a **new object**, but does **not recursively copy** the nested objects inside the original object. Instead, it copies only the references (or pointers) to the nested objects. In other words, the **shallow copy** contains references to the same memory locations as the original, so changes to the nested objects in the copy will affect the original object as well.

- **Shallow Copy Behavior**: Copies the **top-level object** only, and the **nested objects** are shared between the original and the copy.
- **Key point**: If the copied object contains references to other objects (like arrays or dictionaries), those references are not copied; instead, both the original and the copy point to the same objects.

#### Example of Shallow Copy in Swift:

```swift
class Person {
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

let person1 = Person(name: "Alice", address: "123 Main St")
let person2 = person1  // Shallow copy: both point to the same object in memory

person2.name = "Bob"
print(person1.name)  // Output: Bob
```

Here:
- `person1` and `person2` are pointing to the **same instance** of `Person` in memory.
- Modifying `person2` affects `person1` because both are references to the same object.

#### Shallow Copy with Arrays:

```swift
var arr1 = [1, 2, 3]
var arr2 = arr1  // Shallow copy

arr2[0] = 99
print(arr1[0])  // Output: 99
```

Here:
- Both `arr1` and `arr2` point to the **same array** in memory. Modifying one affects the other.

---

### Deep Copy

A **deep copy** creates a **new object** as well as **new instances of all objects** or **nested data** inside the original object. This means that **the copied object and the original object do not share any references** to nested data structures; instead, they are completely independent. Changes to the deep copy will not affect the original object and vice versa.

- **Deep Copy Behavior**: Copies both the **top-level object** and recursively copies all the **nested objects**.
- **Key point**: The deep copy is **independent** from the original, with no shared references.

#### Example of Deep Copy in Swift:

In Swift, `class` types are reference types, so the default behavior when assigning an object is a **shallow copy**. To achieve a **deep copy**, you need to manually copy the nested objects.

```swift
class Person {
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
    // Deep copy function
    func deepCopy() -> Person {
        return Person(name: self.name, address: self.address)
    }
}

let person1 = Person(name: "Alice", address: "123 Main St")
let person2 = person1.deepCopy()  // Deep copy: separate instance

person2.name = "Bob"
print(person1.name)  // Output: Alice (original is unaffected)
print(person2.name)  // Output: Bob
```

Here:
- `person1` and `person2` are **completely independent** objects. Modifying `person2` does not affect `person1`.

#### Deep Copy with Arrays:

For an array of objects, a deep copy would involve copying not just the array but also the objects inside it.

```swift
class Person {
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

var arr1 = [Person(name: "Alice", address: "123 Main St"), Person(name: "Bob", address: "456 Oak St")]
var arr2 = arr1.map { Person(name: $0.name, address: $0.address) }  // Deep copy using map

arr2[0].name = "Charlie"
print(arr1[0].name)  // Output: Alice (arr1 is unaffected)
print(arr2[0].name)  // Output: Charlie
```

Here:
- `arr1` and `arr2` are **completely independent arrays**.
- Modifying an element in `arr2` does not affect `arr1`, because each object inside the arrays has been **deeply copied**.

---

### Key Differences Between Shallow and Deep Copy:

| **Aspect**                | **Shallow Copy**                                       | **Deep Copy**                                      |
|---------------------------|--------------------------------------------------------|---------------------------------------------------|
| **What is copied?**        | Only the **top-level object** (references to nested objects are copied) | The **top-level object** and all nested objects are copied |
| **References to nested data** | Shared between original and copied object              | Independent copies of all nested data             |
| **Memory Management**      | The original and copied object share memory for nested objects | The original and copied object have independent memory for nested objects |
| **Changes to Nested Data** | Changes in the nested objects affect both the original and the copy | Changes in the nested objects affect only the copy (not the original) |
| **Example Use Case**       | Useful when you want to copy the structure but share nested data | Useful when you need to fully duplicate the entire object and its nested data |

---

### When to Use Each:

- **Shallow Copy**:
  - Use when you need to copy an object but want to **share** the references to the same underlying data.
  - Example: If you have a collection of items where you don't need independent copies of their nested properties (e.g., sharing a configuration object across multiple instances).

- **Deep Copy**:
  - Use when you need to **completely clone** an object and ensure that changes in the copy don’t affect the original, especially if the object contains nested data or references to other objects.
  - Example: When working with complex data structures (like graphs or trees) where nested objects should not be shared between the original and the copy.

---

### Conclusion:

- A **shallow copy** creates a new object but only copies references to the objects inside it. The original and the copied object share references to nested objects.
- A **deep copy** creates both a new object and new instances of all the nested objects, ensuring that the original and the copy do not share any references, and changes to one do not affect the other.

In Swift, for reference types (like classes), the default behavior is shallow copying. To achieve a deep copy, you need to implement a custom copying mechanism, as shown in the examples above. For value types (like structs), Swift automatically creates a deep copy when assigned or passed around because structs are copied by value.
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

6. Podfile and Podspec
 
| **Feature**           | **Podfile**                                            | **Podspec**                                             |
|-----------------------|-------------------------------------------------------|--------------------------------------------------------|
| **Purpose**           | Used by developers to install dependencies into their project. | Used by library authors to define the configuration for their pod. |
| **Scope**             | Specifies which dependencies the current project needs. | Defines how a pod should be packaged and installed.     |
| **Used by**           | Developers who are working on the application.        | Authors who are creating reusable libraries/pods.       |
| **Location**          | Found in the root directory of the Xcode project (or workspace). | Found in the root directory of the pod's repository.    |
| **Fields**            | Declares dependencies and installation options (e.g., version, target). | Declares metadata, source files, dependencies, and platform details for the pod. |

   7. 
 ******

 ### Ideal way to share framework without exposing code: 
- https://help.apple.com/xcode/mac/current/#/dev6f6ac218b
- https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages
- https://medium.com/trueengineering/xcode-and-xcframeworks-new-format-of-packing-frameworks-ca15db2381d3
