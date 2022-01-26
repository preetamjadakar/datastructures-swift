//: [Previous](@previous)

import Foundation

func checkForAnagram(firstString: String, secondString: String) -> Bool {
    return firstString.sorted() == secondString.sorted()
}

checkForAnagram(firstString: "asDdd", secondString: "ddsad")
//: [Next](@next)
