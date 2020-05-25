// Problem - Statement
// Use the below give stack and implement the custom Queue
struct Stack<Element> {
    var storage: [Element] = []
    init() {
        
    }
    
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
    
    ///Gives the pick of stack i.e. last element of the array
    func pick() -> Element? {
        return storage.last
    }
    
    /// Push the value on to the stack
    mutating func push(element: Element) {
        storage.append(element)
    }

    /// Pop the lastly added item
    mutating func pop() -> Element? {
        guard !storage.isEmpty else {
            print("can't pop empty stack")
            return nil
        }
        return storage.removeLast()
    }
}


struct CrazyQueue<Element> {
    var topStack = Stack<Element>()
    var bottomStack = Stack<Element>()
    
    init() {    }
    
    mutating func enqueue(_ value:Element) {
        while !bottomStack.isEmpty() {
            topStack.push(element: bottomStack.pop()!)
        }
        topStack.push(element: value)
    }
    
    mutating func dequeue() -> Element? {
        while !topStack.isEmpty() {
            bottomStack.push(element: topStack.pop()!)
        }
        return bottomStack.pop()
    }
    
    mutating func peek() -> Element? {
        if !topStack.isEmpty() {
            return topStack.storage.first
        } else {
            return bottomStack.storage.last
        }
    }
}


var myQueue = CrazyQueue<String>();
myQueue.peek();
myQueue.enqueue("Joy");
myQueue.enqueue("Matt");
myQueue.enqueue("Pavel");
myQueue.enqueue("Samir");
myQueue.peek()
myQueue.dequeue();
myQueue.dequeue();
myQueue.peek()
print(myQueue)
