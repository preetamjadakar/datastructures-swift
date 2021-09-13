///Check if given sequence of parantheses is valid
///Open brackets must be closed by the same type of brackets.
///Open brackets must be closed in the correct order.

import UIKit

var brackets = "{{([()])}}"

func areParanthesisBalanced(_ expressetion: String) -> Bool {
    var stack = [Character]()
    
    for char in brackets {
        switch char {
        case "{", "(", "[":
            stack.append(char) //{{([(
        case "}":
            let top = stack.popLast()
            if top != "{" {
                return false
            }
        case ")":
            let top = stack.popLast()
            if top != "(" {
                return false
            }
        case "]":
            let top = stack.popLast()
            if top != "[" {
                return false
            }
        default:
            break
        }
    }
    if stack.count > 0 { return false }
    return true
}

print(areParanthesisBalanced(brackets) ? "Balanced" : "Unbalanced")
