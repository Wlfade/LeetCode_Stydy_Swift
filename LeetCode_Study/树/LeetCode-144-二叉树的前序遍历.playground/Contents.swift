//https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Solution {
    //递归
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        guard root != nil else {
//            return []
//        }
//        var array = [Int]()
//        array += inorderTraversal(root?.left)
//
//        array.append(root!.val)
//
//        array += inorderTraversal(root?.right)
//
//        return array
//    }
    //迭代 前序遍历
     func preorderTraversal(_ root: TreeNode?) -> [Int] {
          guard let root = root else { return [] }
         
          var res: [Int] = []
          var stack: [TreeNode] = [root]
         
          while let node = stack.popLast() {
              res.append(node.val)
              if let right = node.right { stack.append(right)}
              if let left = node.left { stack.append(left) }
          }
          return res
      }
    
}


