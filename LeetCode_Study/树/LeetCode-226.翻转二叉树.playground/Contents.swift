import UIKit

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
    //前序遍历
   func invertTree1(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let temp = root.left
        root.left = root.right
        root.right = temp
        invertTree1(root.left)
        invertTree1(root.right)
        return root
    }
    
    //后续遍历
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
         guard let root = root else { return nil }
         invertTree2(root.left)
         invertTree2(root.right)
        
        let temp = root.left
        root.left = root.right
        root.right = temp

         return root
     }
    
    //中序遍历
    func invertTree3(_ root: TreeNode?) -> TreeNode? {
         guard let root = root else { return nil }
         invertTree3(root.left)
        
        //交换后
        let temp = root.left
        root.left = root.right
        root.right = temp

         invertTree3(root.left) //还是left
         return root
     }
    
    func invertTree4(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            //交换后
            let temp = node.left
            node.left = node.right
            node.right = temp

            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right{
                queue.append(right)
            }
        }
        return root
     }

}
