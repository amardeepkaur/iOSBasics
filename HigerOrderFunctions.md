## Higher order functions:

### Transformation & Filtering

| Function           | Description                                      | Example |
|--------------------|--------------------------------------------------|---------|
| map(_:)          | Transforms each element using a closure.         | `[1,2,3].map { $0 * 2 } // [2,4,6]` |
| compactMap(_:)   | Transforms elements and removes `nil`s.          | `["1", "a", "3"].compactMap { Int($0) } // [1,3]` |
| flatMap(_:)      | Flattens a sequence of sequences.                | `[[1,2],[3,4]].flatMap { $0 } // [1,2,3,4]` |
| filter(_:)      | Filters elements matching a predicate.           | `[1,2,3].filter { $0 > 1 } // [2,3]` |
| reduce(_: _:)    | Combines elements using a closure.               | `[1,2,3].reduce(0, +) // 6` |
| reduce(into:_:)  | Modifies a mutable result in-place.              | `[1,2,3].reduce(into: []) { $0.append($1 * 2) } // [2,4,6]` |
| enumerated()     | Enumerates a sequence with index.                | `["a", "b"].enumerated().map { "\($0):\($1)" } // ["0:a","1:b"]` |
| prefix(_:)       | Returns the first `n` elements.                  | `[1,2,3,4].prefix(2) // [1,2]` |
| prefix(while:)   | Returns elements while condition is true.        | `[1,2,3].prefix { $0 < 3 } // [1,2]` |
| suffix(_:)       | Returns the last `n` elements.                   | `[1,2,3,4].suffix(2) // [3,4]` |

### Searching

| Function           | Description                                      | Example |
|--------------------|--------------------------------------------------|---------|
| first(where:)    | Returns the first match.                         | `[1,2,3].first { $0 > 1 } // 2` |
| last(where:)     | Returns the last match.                          | `[1,2,3].last { $0 < 3 } // 2` |
| contains(where:) | Checks if any element matches.                   | `["apple", "banana"].contains { $0.hasPrefix("a") } // true` |
| allSatisfy(_:)   | True if all elements match condition.            | `[2,4,6].allSatisfy { $0 % 2 == 0 } // true` |
| min(by:)         | Finds min using custom comparator.               | `[3,1,2].min(by: >) // 3` |
| max(by:)         | Finds max using custom comparator.               | `[3,1,2].max(by: <) // 3` |

### Combining & Splitting

| Function             | Description                                      | Example |
|----------------------|--------------------------------------------------|---------|
| `joined()`           | Flattens a sequence of sequences.                | `[["a","b"],["c"]].joined() // ["a","b","c"]` |
| `joined(separator:)` | Joins with separator.                            | `[["a"], ["b"]].joined(separator: ["x"]) // ["a","x","b"]` |
| `split(separator:)`  | Splits collection into subsequences.            | `"a,b,c".split(separator: ",") // ["a", "b", "c"]` |
| `zip(_:_)`           | Pairs elements from two sequences.               | `zip([1,2], ["a","b"]).map { "\($0):\($1)" } // ["1:a","2:b"]` |
| `merge()` *(custom)* | Merges two dictionaries.                         | `dict1.merging(dict2) { $1 }` |

### Sorting & Comparing

| Function               | Description                                      | Example |
|------------------------|--------------------------------------------------|---------|
| `sorted(by:)`          | Sorts using custom comparator.                   | `[3,1,2].sorted(by: <) // [1,2,3]` |
| `sorted()`             | Sorts using `<`.                                 | `[3,1,2].sorted() // [1,2,3]` |
| `partition(by:)`       | Partitions by predicate.                         | `var a = [1,2,3,4]; let i = a.partition { $0 > 2 } // index: 2` |
| `elementsEqual(_:)`,  `elementsEqual(_:by:)`    | Compares two sequences element-wise.             | `[1,2].elementsEqual([1,2]) // true` |

### Iteration

| Function                    | Description                                      | Example |
|-----------------------------|--------------------------------------------------|---------|
| `forEach(_:)`               | Iterates over elements.                          | `[1,2,3].forEach { print($0) }` |
| `stride(from:to:by:)`       | Ranges with custom steps (exclusive).            | `for i in stride(from: 0, to: 10, by: 2) { print(i) }` |
| `stride(from:through:by:)`  | Ranges with custom steps (inclusive).            | `for i in stride(from: 0, through: 10, by: 2) { print(i) }` |

### Dictionary-specific

| Function               | Description                                      | Example |
|------------------------|--------------------------------------------------|---------|
| `mapValues(_:)`        | Transforms dictionary values.                    | `[1: "one"].mapValues { $0.uppercased() } // [1: "ONE"]` |
| `filter(_:)`           | Filters key-value pairs.                         | `[1: "a", 2: "b"].filter { $0.key > 1 } // [2: "b"]` |
| `compactMapValues(_:)` | Transforms and removes `nil` values.             | `[1: "1", 2: "a"].compactMapValues { Int($0) } // [1: 1]` |

### Lazy Variants

| Function | Description                    | Example |
|----------|--------------------------------|---------|
| `.lazy`  | Enables lazy evaluation chains | `[1,2,3].lazy.filter { $0 > 1 }.map { $0 * 2 } // LazyMapSequence` |
