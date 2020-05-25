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

class BinarySearchTree<Element> {
    private(set) var root:BinaryNode<Element>?
    
    init() {    }

}
