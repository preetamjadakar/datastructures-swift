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
    ///Gives the peek of queue i.e. first element of the list
    func peek() -> Node<Element>? {
        return first
    }
    
    /// Push the value in queue i.e. at last
    mutating func enqueue(_ value:Element) {
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
    mutating func dequeue() -> Node<Element>? {
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

stack.enqueue("google")
stack.enqueue("facebook")
stack.enqueue("udemy")
stack.enqueue("twitter")
print(stack)
stack.dequeue()
print(stack)
print(stack.peek()?.value ?? "Queue is empty")
