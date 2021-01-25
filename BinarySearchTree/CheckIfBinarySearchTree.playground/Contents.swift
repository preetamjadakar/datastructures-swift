//  Definition for a binary tree node.
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
      }
 }
extension TreeNode {
    func traverseInorder(visit:(TreeNode)->Void) {
        self.left?.traverseInorder(visit: visit)
        visit(self)
        self.right?.traverseInorder(visit: visit)
    }
}
class Solution {
    func isValidBST2(_ root: TreeNode?) -> Bool {
        var data = [Int]()
        root?.traverseInorder { (node) in
            data.append(node.val)
        }
        print(data)

        //check if array is sorted
        for i in 1..<data.count  {
            if data[i-1] > data[i] {
                return false
            }
        }
        return true
    }
    func isValidBST(_ root: TreeNode?) -> Bool {
       return isBst(root, min: Int.min, max: Int.max)
    }

    private func isBst(_ node: TreeNode?, min: Int, max: Int) -> Bool {
        if node == nil { return true }
        if node!.val <= min || node!.val >= max { return false }
        return isBst(node?.left, min: min, max: node!.val) &&
               isBst(node?.right, min: node!.val, max: max)

    }
}
let left = TreeNode(5)
left.left = nil
left.right = nil
let right = TreeNode(24)
right.left = TreeNode(20)
right.right = TreeNode(30)
let root = TreeNode.init(15, left, right)
let solution = Solution()
print(solution.isValidBST(root))


