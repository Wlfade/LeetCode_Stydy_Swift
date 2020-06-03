
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
 
class Solution {
    func flatten(_ root: TreeNode?) {
        var node = root
        
        guard  node != nil else {
            return
        }
        while node != nil{
            if(node!.left == nil){
                node = node!.right
            }else{
                //找到左子树的最右侧节点
                var pre = node!.left!
                while pre.right != nil{
                    pre = pre.right!
                }
                //将原来的右子树接到左子树
                pre.right = node!.right
                //将左子树插入到右子树的地方
                node!.right = node!.left
                node!.left = nil

                //考虑到下个节点
                node = node!.right
            }
       }
        print("------")

    }

}
