class BinaryNode<Element>{
    var value: Element
    var leftNode: BinaryNode?
    var rightNode: BinaryNode?
    init(_ value: Element) {
        self.value = value
    }
    
    //left is minimum, if not available then self is minimum
    var min:BinaryNode? {
        return leftNode?.min ?? self
    }
    
    public func minimum() -> BinaryNode {
      var node = self
      while let next = node.leftNode {
        node = next
      }
      return node
    }

    public func maximum() -> BinaryNode {
      var node = self
      while let next = node.rightNode {
        node = next
      }
      return node
    }
}

// This is for display purposes ONLY!!!
extension BinaryNode: CustomStringConvertible {
    public var description: String {
      var s = ""
      if let left = leftNode {
        s += "(\(left.description)) <- "
      }
      s += "\(value)"
      if let right = rightNode {
        s += " -> (\(right.description))"
      }
      return s
    }
}

extension BinarySearchTree:CustomStringConvertible {
    var description: String {
        guard let root = root else {
            return "Empty Tree"
        }
        return String(describing:root)
    }
    
}

struct BinarySearchTree<Element:Comparable> {
    private(set) var root:BinaryNode<Element>?
    
    init() {    }
    
    mutating func insert(_ value: Element) -> BinarySearchTree{
        let newNode = BinaryNode(value)
        if root == nil {
            root = newNode
            return self
        } else {
            guard let root = root else {
                return self
            }
            var currentNode = root
            while true {
                if value < currentNode.value {
                    //check left node
                    if currentNode.leftNode == nil {
                        currentNode.leftNode = newNode
                        return self
                    } else {
                        currentNode = currentNode.leftNode! //force-casting is fine in this case because we already done nil check
                    }
                } else {
                    if value == currentNode.value {
                        fatalError("duplicates are not allowed in BST")
                    }
                    //check right node
                    if currentNode.rightNode == nil {
                        currentNode.rightNode = newNode
                        return self
                    } else {
                        currentNode = currentNode.rightNode!
                    }
                }
            }
        }
        return self
    }
    
    ///Check if value is available in a BST
    func lookup(_ value: Element) -> Bool {
        var currentNode = root
        while let node = currentNode {
            if value < node.value {
                currentNode = node.leftNode
            } else if value > node.value {
                currentNode = node.rightNode
            } else { //equal check
                return true
            }
        }
        return false
    }
    
    ///Remove a value from BST
    func remove(_ value:Element) -> Bool {
        if root == nil {
            //bst is empty
            return false
        } else if value == root!.value {
            //get right node and find the leftmost node of it and then assign to its left
            
        } else {
            var currentNode = root
            var parent:BinaryNode<Element>? = nil
            
            while let node = currentNode {
                if value < node.value {
                    parent = currentNode
                    currentNode = currentNode?.leftNode
                } else if value > node.value {
                    
                    parent = currentNode
                    currentNode = currentNode?.rightNode
                } else {
                    //equal value, node found
                    if currentNode?.leftNode == nil {
                        parent?.rightNode = currentNode?.rightNode
                        return true
                    } else if currentNode?.rightNode == nil {
                        parent?.leftNode = currentNode?.leftNode
                        return true
                    } else if currentNode?.leftNode == nil && currentNode?.rightNode == nil {
                        // leaf node
                        currentNode = nil
                        return true
                    } else {
                        //has both right and left nodes
                        return true
                    }
                }
            }
        }
        print("node NOT found")
        return false
    }
}

var bst = BinarySearchTree<Int>()
bst.insert(5)
bst.insert(7)
bst.insert(8)
bst.insert(18)
bst.insert(28)
bst.insert(6)
bst.insert(10)
bst.insert(9)
bst.insert(2)
bst.insert(4)

print(bst)

print(bst.lookup(28))

bst.remove(7)
bst.remove(10)
bst.remove(337)
bst.remove(5)
print(bst)
