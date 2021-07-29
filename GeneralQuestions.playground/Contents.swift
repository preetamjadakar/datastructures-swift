import UIKit

///Associated Types:
///Associated types are a powerful way of making protocols generic

protocol ItemStoring {
    associatedtype DataType
    var items: [DataType] { get set}
    mutating func add(item: DataType)
}

extension ItemStoring {
    mutating func add(item: DataType) {
        items.append(item)
    }
}

struct NameDatabase: ItemStoring {
    var items = [String]()
}
struct ValueDatabase: ItemStoring {
    var items = [Int]()
}

var names = NameDatabase()
names.add(item: "James")
names.add(item: "Jess")

print(names)

var values = ValueDatabase()
values.add(item: 2)
values.add(item: 4)
print(values)

///static VS class functions
///class functions can be overriden unlike static
///static is same as class final
///In case of static functions, if we access one of the static member, entire class gets loaded in memory. But in case of global function, only that particular function will be loaded in memory.


///Hashable

let valuesSet = Set<Int>(arrayLiteral: 1, 2, 2,3)
print(valuesSet.count)
struct Student {
    let name: String
    let id: Int
}

extension Student: Equatable {
}
extension Student: Hashable {
}


///Lazy Vs Computed

struct ABCD {
    lazy var someProperty: String = {
        
        return String(5)
    }()
}


///Closures are self-contained blocks of functionality that can be passed around and used in your code. — Apple

// Closure take no parameter and return nothing
let sayHello: () -> Void = {
    print("Hello")
}

sayHello()

// Closure take one parameter and return 1 parameter
let value: (Int) -> Int = { (value1) in
    return value1
}

print(value(5))

// Closure take two parameter and return 1 parameter
let add: (Int, Int) -> Int = { (value1, value2) in
    return value1 + value2
}

print(add(5, 4))

// Closure take two parameter and return String parameter
let addValues: (Int, Int) -> String = { (value1, value2) -> String in
    return String("Sum is: \(value1 + value2)")
}

print(addValues(5, 4))

///Closure as an argument to method call

func makeSquare(of number:Int, completion:(Int)->Void) {
    let square = number * number
    completion(square)
}

makeSquare(of: 5) { (result) in
    print(result)
}


///Non-escaping Closures: By Default

///When you are passing a closure as the function argument, the closure gets execute with the function’s body and returns the compiler back. As the execution ends, the passed closure goes out of scope and have no more existence in memory.


/// POP: Protocol Oriented Programing
protocol CanBark {
    func bark()
}
protocol CanWaggTail {
    func waggTail()
}
struct Dog {
    
    // Protocol Composition
    typealias Dependency = CanBark & CanWaggTail
    
    let dogManager: Dependency
    
    func ballFound() {
        dogManager.waggTail()
        dogManager.bark()
    }
}
/*----- Another Way! -----*/
// Protocol Composition
protocol CanDoDogThings: CanBark, CanWaggTail {
    
}
struct Dog2 {
    let dogManager: CanDoDogThings
    
    func ballFound() {
        dogManager.waggTail()
        dogManager.bark()
    }
}
