struct Queue<T> {
    var storage: [T] = []
    
    mutating func enqueue(_ value: T) {
        storage.append(value)
    }
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    mutating func dequeue() -> T? {
        return isEmpty ? nil : storage.removeFirst()
    }
}

class TreeNode<T> where T: Equatable {
    var value: T
    var childs:[TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ node: TreeNode<T>) {
        childs.append(node)
    }
}

extension TreeNode {
    func forEachDepthFirst(_ visit:(TreeNode)-> Void) {
        visit(self)
        childs.forEach { (node) in
            node.forEachDepthFirst(visit)
        }
    }
    
    func forEachLevelOrderTraversal(_ visit: (TreeNode) -> Void) {
        visit(self)
        var tracker = Queue<TreeNode>()
        childs.forEach { (child) in
            tracker.enqueue(child)
        }
        print(tracker.storage.map{$0.value})
        while let node = tracker.dequeue() {
            visit(node)
            node.childs.forEach { (child) in
                tracker.enqueue(child)
            }
            print(tracker.storage.map{$0.value})
        }
    }
    
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrderTraversal { (node) in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

let beverages = TreeNode.init("Beverages")

let hot = TreeNode.init("Hot")
let cold = TreeNode.init("Cold")

beverages.add(hot)
beverages.add(cold)

let tea = TreeNode.init("Tea")
let coffee = TreeNode.init("Coffee")
hot.add(tea)
hot.add(coffee)

let soda = TreeNode.init("Soda")
let milk = TreeNode.init("Milk")
cold.add(soda)
cold.add(milk)

let milkSource = TreeNode.init("Cow")
milk.add(milkSource)

let sourceLocation = TreeNode.init("India")
milkSource.add(sourceLocation)


beverages.forEachDepthFirst { (node) in
    print(node.value)
}
print("==============")

beverages.forEachLevelOrderTraversal { (node) in
    print(node.value)
}
/*

                Beverages
                /       \
               /         \
             Hot        Cold
            /  \        /  \
           /    \      /    \
         Tea   Coffee Soda  Milk
                            /
                          Cow
                          /
                        India
*/

if let resultNode = beverages.search("Milk") {
    print(resultNode.value)
} else {
    print("Node not found")
}
