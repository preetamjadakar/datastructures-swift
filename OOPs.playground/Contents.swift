import UIKit

///1. CLASSES
class Person {


    //1
    var age: Int!
    var gender: String!
    var maritialStatus: String!

    init(age: Int, gender: String, maritialStatus: String) {
        self.age = age
        self.gender = gender
        self.maritialStatus = maritialStatus
    }

    ///3. METHODS
    func play(sport: String) {
        //Write down how you will make your person instance play.
    }
}

///2. OBJECTS
let man = Person(age: 5, gender: "male", maritialStatus: "married")

///4. ACCESS SPECIFIRS
///4.1 OPEN: Can be accessed and inherited in other modules
///4.2 PUBLIC: Can be accessed but can't be inherited in other modules
///4.3 FILE PIVATE: Limited to the defined file
///4.4 PIVATE: Limited to the defining enclosure

///5. ENCAPSULATION is a concept by which we hide data and methods from outside intervention and usage.

///6. ABSTRACTION: we expose relevant data and methods of an object hiding their internal implementation.

///7. INHERITANCE: process by which a child class inherits the properties of its parent class.

class Men: Person {
    ///9. METHOD OVERRIDING: child class has method with same signature which overrides the inherited behaviour.
        override init(age: Int, gender: String, maritialStatus: String) {
            super.init(age: age, gender: gender, maritialStatus: maritialStatus)
        }

    ///8. METHOD OVERLOADING: Method overloading is the process by which a class has two or more methods with same name but different parameters.
    func play(instrument: String) {
    }
}

let andy = Men(age: 2, gender: "M", maritialStatus: "M")
print(andy.age ?? 0) // prints 2


///10. POLYMORPHISM: Objects of the same class can behave independently within the same interface.

class Player {
  let name: String
  init(name: String) {
    self.name = name
  }
  func play() { }
}
class Batsman: Player {
  override func play() {
    bat()
  }
  private func bat() {
    print("\(name) is batting 🏏")
  }
}
class Bowler: Player {
  override func play() {
    bowl()
  }
  private func bowl() {
    print("\(name) is bowling 🏏")
  }
}
class CricketTeam {
  let name: String
  let team: [Player]
  init(name: String, team: [Player]) {
    self.name = name
    self.team = team
  }
  func play() {
    team.forEach { $0.play() }
  }
}
let rohitSharma = Batsman(name: "Rohit Sharma")
let bumrah = Batsman(name: "Jasprit Bumrah")
let indianTeam = CricketTeam(name: "India", team: [rohitSharma, bumrah])
indianTeam.play()

