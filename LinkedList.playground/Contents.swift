import UIKit

class Node<Value> {
    var value: Value
    var next: Node?
    init(value: Value, next:Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> \(next) " //recursive call
    }
}

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    init(){}
    
    mutating func append(value: Value) {
        if isEmpty {
            head = Node.init(value: value)
            tail = head
        } else {
            let newNode = Node.init(value: value)
            tail?.next = newNode
            tail = newNode
        }
    }
    
    /// Push is also called as prepend
    mutating func push(value:Value) {
        if isEmpty {
            head = Node.init(value: value)
            tail = head
        } else {
            head = Node.init(value: value, next: head)
        }
    }
    
    mutating func pop() -> Node<Value>? {
        guard head != nil else {
            print("popping can't be done on empty list")
            return nil
        }
        let deletedNode = head
        head = head?.next
        return deletedNode
    }
    
    mutating func removeLast() -> Value? {
        guard head != nil else {
            print("can't perform `removeLast` for empty list")
            return nil
        }
        guard head?.next != nil else {
            return pop()?.value
        }
        var iterator = head
        
        while iterator?.next?.next != nil { // previous of tail
            iterator = iterator?.next
        }
        let currentTail = tail
        tail = iterator
        tail?.next = nil
        return currentTail?.value
    }
    
    mutating func remove(at index:Int) -> Value? {
        guard !isEmpty else {
            print("list is empty")
            return nil
        }
        guard head !== tail else {
            return pop()?.value
        }
        if index == 0 {
            defer {
                head = head?.next
            }
            return head?.value
        } else {
            var targetNode = head
            var iterator = 0
            while head?.next != nil,  iterator < index - 1 {
                targetNode = targetNode?.next
                iterator += 1
            }
            //remove node
            defer {
                targetNode?.next = targetNode?.next?.next
            }
            return targetNode?.next?.value
        }
    }
    
    private func getPreviousNode(of index:Int) -> Node<Value>? {
        var node = head
        var currentIndex = 0
        while node?.next != nil, currentIndex < index-1 {
            node = node?.next
            currentIndex += 1
        }
        return node
    }
    
    mutating func insert(_ value:Value, at index:Int) {
        if index < 0 {
            print("invalid index")
        } else if index == 0 {
            push(value: value)
        } else {
            let newNode = Node.init(value: value)
            let leaderNode = getPreviousNode(of: index)
            
            newNode.next = leaderNode?.next
            leaderNode?.next = newNode
        }
    }
    
    mutating func reverse() -> Node<Value>? {
        //[5, 3, 2, 9]
        if head?.next == nil {
            // just one element so no need to reverse
            print("do nothing, list is already reversed")
            return head
        }
        
        var previous:Node<Value>? = nil
        var currentNode = head
        tail = currentNode
        var next:Node<Value>? = nil
        
        while (currentNode != nil) {
            next = currentNode?.next
            currentNode?.next = previous
            previous = currentNode
            currentNode = next
        }
        head?.next = nil
        head = previous
        print(head, tail)
        return previous
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


var list = LinkedList<Int>()
list.push(value: 2)
list.push(value: 3)
list.push(value: 22)
list.push(value: 33)
list.append(value: 1)

list.insert(5, at: 2)
print(list)
list.pop()
print(list)
list.removeLast()
print(list)
list.insert(5, at: 2)
print(list)

list.remove(at: 1)
print(list)

list.remove(at: 0)
list.append(value: 9)
list.append(value: 19)
list.append(value: 29)
print(list)

print("===========================")
print(list.reverse()!)
