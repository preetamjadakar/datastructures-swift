import UIKit

class Node<Value> {
    var value: Value
    var reference: Node?
    init(value: Value, reference:Node? = nil) {
        self.value = value
        self.reference = reference
    }
}

extension Node: CustomStringConvertible {
    var description: String{
        guard let next = reference else {
            return "\(value)"
        }
        return "\(value) ->  \(next)"
    }
}

let node1 = Node.init(value: 2)
let node2 = Node.init(value: 4)
let node3 = Node.init(value: 6)

node1.reference = node2
node2.reference = node3

node1
