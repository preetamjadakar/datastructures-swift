import UIKit

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    init(){}
    
    mutating func push(value:Value) {
        if isEmpty {
            head = Node.init(value: value)
            tail = head
        } else {
            head = Node.init(value: value, next: head)
        }
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        if isEmpty {
            return "Linked list is empty"
        } else {
            return "\(String.init(describing: head!))"
        }
    }
}
class Node<Value> {
    var value: Value
    var next: Node?
    init(value: Value, next:Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String{
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) ->  \(String.init(describing: next))"
    }
}


var list = LinkedList<Int>()
list.push(value: 2)
list.push(value: 3)
list.push(value: 22)

print(list)
