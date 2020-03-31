import UIKit

struct Queue<T> {
    var storage:[T] = []
    
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
    
    var peek:T? {
        return storage.first
    }
    
    init() {}
    
    mutating func enQueue(_ element: T) {
        storage.append(element)
    }
    
    mutating func deQueue() -> T? {
        guard !isEmpty() else {
            print("can't dequeue empty queue")
            return nil
        }
        return storage.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String.init(describing: storage)
    }
}


var queue = Queue<String>()
queue.enQueue("om")
queue.enQueue("fat")
queue.enQueue("swaha")
print(queue)
queue.deQueue()
print(queue)
