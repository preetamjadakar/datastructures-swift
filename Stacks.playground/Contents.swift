import UIKit


struct Stack<Element> {
    var storage: [Element] = []
    init() {
        
    }
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
    mutating func push(element: Element) {
        storage.append(element)
    }

    mutating func pop() -> Element? {
        guard !storage.isEmpty else {
            print("can't pop empty stack")
            return nil
        }
        return storage.removeLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        let topDivider = "----- Top Divider ----- \n"
        let bottomDivider = "\n----- Bottom Divider ------\n"
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()
stack.push(element: 3)
stack.push(element: 4)
stack.push(element: 5)
print(stack)
stack.pop()
print(stack)
stack.pop()
print(stack)
stack.pop()
print(stack)
stack.pop()
print(stack)
stack.pop()
print(stack)
