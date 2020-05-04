class Node<Element> {
    var value: Element
    var next: Node?
    init(_ value: Element) {
        self.value = value
        self.next = nil
    }
}

extension Node: CustomStringConvertible {
    var description: String{
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) <- \(next) " //recursive call
    }
}

struct Queue<Element> {
    var first: Node<Element>?
    var last: Node<Element>?
    var length = 0
    
    init() { }
    
    func isEmpty() -> Bool {
        return length == 0
    }
    ///Gives the pick of queue i.e. first element of the list
    func pick() -> Node<Element>? {
        return first
    }
    
    /// Push the value in queue i.e. at last
    mutating func push(_ value:Element) {
        let newNode = Node(value)
        if isEmpty() {
            self.first = newNode
            self.last = newNode
        } else {
            self.last?.next = newNode
            self.last = newNode
        }
        self.length += 1
    }
    
    /// Pop the firstly added item
    mutating func pop() -> Node<Element>? {
        if isEmpty() {
            print("empty Queue can't be popped")
            return nil
        } else {
            if length == 1 { //self.top == self.bottom
                self.last = nil
            }
            defer {
                self.first = self.first?.next
                self.length -= 1
            }
            return self.first
        }
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        if isEmpty() {
            return "Queue is empty"
        } else {
            return "\(String.init(describing: first!))"
        }
    }
}
var stack = Queue<String>()

stack.push("google")
stack.push("facebook")
stack.push("udemy")
stack.push("twitter")
print(stack)
stack.pop()
print(stack)
print(stack.pick()?.value ?? "Queue is empty")
