import UIKit

class BinaryNode<Element> {
    var value: Element
    var leftChlid: BinaryNode?
    var rightChild: BinaryNode?
    init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    func traverseInOrder(_ visit:(BinaryNode)->Void) {
        leftChlid?.traverseInOrder(visit)
        visit(self)
        rightChild?.traverseInOrder(visit)
    }
    
    func traversePostOrder(_ visit:(BinaryNode)->Void) {
        leftChlid?.traversePostOrder(visit)
        rightChild?.traversePostOrder(visit)
        visit(self)
    }
    
    func traversePreOrder(_ visit:(BinaryNode)->Void) {
        visit(self)
        leftChlid?.traversePreOrder(visit)
        rightChild?.traversePreOrder(visit)
    }
    func inorder() {
        leftChlid?.inorder()
        print("\(self.value)", terminator: "\n")
        rightChild?.inorder()
    }
}
let root = BinaryNode.init(10)
root.leftChlid = BinaryNode.init(9)
root.rightChild = BinaryNode.init(2)

root.leftChlid?.leftChlid = BinaryNode.init(1)
root.leftChlid?.rightChild = BinaryNode.init(3)

root.rightChild?.leftChlid = BinaryNode.init(4)
root.rightChild?.rightChild = BinaryNode.init(6)

/*
                  10
                /    \
               /      \
              9        2
             / \      /  \
            /   \    /    \
           1     3  4      6
 
 In-Order traversal is visit the very left most node first then his parent, then right node of left-most. Root at the middle
 eg: 1,9,3,10,4,2,6
 
 Post-Order traversal is visit the childs first then parent. Root at the end.
 eg: 1,3,9,4,6,2,10
 
 Pre-Order traversal is visit the parent first and the childs. Root at first.
 eg: 10,9,1,3,2,4,6
*/

print("====In Order====")
root.traverseInOrder { (node) in
    print(node.value)
}
print("====Post Order====")
root.traversePostOrder { (node) in
    print(node.value)
}
print("====Pre Order====")
root.traversePreOrder { (node) in
    print(node.value)
}

root.inorder()
