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

struct Stack<Element> {
    var top: Node<Element>?
    var bottom: Node<Element>?
    var length = 0
    
    init() { }
    
    func isEmpty() -> Bool {
        return length == 0
    }
    ///Gives the peek of stack i.e. lastly added element of the list
    func peek() -> Node<Element>? {
        return top
    }
    
    /// Push the value on to the stack
    mutating func push(_ value:Element) {
        let newNode = Node(value)
        if isEmpty() {
            self.top = newNode
            self.bottom = newNode
        } else {
            let holdingPointer = self.top
            self.top = newNode
            self.top?.next = holdingPointer
        }
        self.length += 1
    }
    
    /// Pop the lastly added item
    mutating func pop() -> Node<Element>? {
        if isEmpty() {
            print("empty stack can't be popped")
            return nil
        } else {
            if length == 1 { //self.top == self.bottom
                self.bottom = nil
                self.top = nil
            }
            defer {
                self.top = self.top?.next
                self.length -= 1
            }
            return self.top
        }
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        if isEmpty() {
            return "Stack is empty"
        } else {
            return "\(String.init(describing: top ?? nil))"
        }
    }
}
var stack = Stack<String>()
stack.peek()

stack.push("google")
stack.push("facebook")
print(stack)
stack.pop()
print(stack)
stack.pop()
print(stack)
