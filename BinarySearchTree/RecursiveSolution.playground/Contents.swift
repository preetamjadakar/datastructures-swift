
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
}

// This is for display purpose.
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
    
    func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftNode
            } else {
                current = node.rightNode
            }
        }
        return false
    }

    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value)
        }
        if value < node.value {
            node.leftNode =  insert(from: node.leftNode, value: value)
        } else {
            node.rightNode =  insert(from: node.rightNode, value: value)
        }
        return node
    }
    
    mutating func remove(_ value: Element) {
        root = remove(from: root, value: value)
    }
    
    private func remove(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard  let node = node else {
            return nil
        }
        
        if value == node.value {
            if node.leftNode == nil, node.rightNode == nil {
                return nil
            }
            if node.leftNode == nil {
                return node.rightNode
            }
            if node.rightNode == nil {
                return node.leftNode
            }
            node.rightNode = remove(from: node.rightNode, value: value)
        } else if value < node.value {
            node.leftNode = remove(from: node.leftNode, value: value)
        } else {
            node.rightNode = remove(from: node.rightNode, value: value)
        }
        return node
    }
}

var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)
print(bst)

print(bst.contains(5))
print(bst.contains(7))
bst.remove(4)
print(bst)
