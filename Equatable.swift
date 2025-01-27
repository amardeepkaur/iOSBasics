struct Animal: Equatable {
    let firstName = "Millie"
    let lastName = "Bear"
    
    static func == (lhs: Animal, rhs: Bird) -> Bool {
        return (lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName)
    }
}

struct Bird: Equatable {
    let firstName = "Millie"
    let lastName = "Bear"
}

let animal = Animal()
let bird = Bird()
print("Hi \(animal.firstName == bird.firstName)")

//true
