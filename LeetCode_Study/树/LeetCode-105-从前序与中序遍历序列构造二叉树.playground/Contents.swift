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
}
extension Solution{
    //
    class func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if
        preorder.count == 0 ||
            
        inorder.count == 0{
            return nil
        }
        return build(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }
    private class func build(_ pre : [Int] , _ preStart : Int , _ preEnd : Int, _ In : [Int], _ inStart : Int, _ inEnd : Int) -> TreeNode?{
        let root = TreeNode.init(pre[preStart])
        let pos = findRoot(root.val, In, inStart, inEnd)
        let leftlen = pos - inStart //左子树长度
        let rightLen = inEnd - pos //右子树长度
        if leftlen > 0 {
            root.left = build(pre, preStart + 1, preStart + leftlen, In, inStart, inStart + leftlen - 1)
        }
        if rightLen > 0 {
            root.right = build(pre, preEnd - rightLen + 1, preEnd, In, inEnd - rightLen + 1, inEnd)
        }
        return root
        
    }
    private class func findRoot(_ rootVal : Int ,_ In : [Int] ,_ inStart : Int , _ inEnd : Int)-> Int{
        for i in inStart...inEnd {
            if In[i] == rootVal {
                return i
            }
        }
        return -1
    }

}

Solution.buildTree([3,9,20,15,7], [9,3,15,20,7])
