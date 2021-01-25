import UIKit

var brackets = "]{{([()])}}"

func areParanthesisBalanced(_ expressetion: String) -> Bool {
    var stack = [Character]()

    for char in brackets {
        switch char {
        case "{", "(", "[":
            stack.append(char) //{{([(
        case "}":
            let top = stack.popLast()
            if top != "{" {
                print("unbalanced")
                return false
            }
            case ")":
            let top = stack.popLast()
            if top != "(" {
                print("unbalanced")
                return false
            }
            case "]":
            let top = stack.popLast()
            if top != "[" {
                print("unbalanced")
                return false
            }
        default:
            break
        }
    }
    return true
}

areParanthesisBalanced(brackets)
