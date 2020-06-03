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
    class func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        if
        pre.count == 0 ||
            
        post.count == 0{
            return nil
        }
        return build(pre, 0, pre.count - 1, post, 0, post.count - 1)
    }
    private class func build(_ pre : [Int] , _ preStart : Int , _ preEnd : Int, _ post : [Int], _ postStart : Int, _ postEnd : Int) -> TreeNode?{
        let root = TreeNode.init(pre[preStart])
        let pos = findRoot(root.val, post, postStart, postEnd)
        let leftlen = pos - postEnd //左子树长度
        let rightLen = postEnd - pos //右子树长度
        if leftlen > 0 {
            root.left = build(pre, preStart + 1, preStart + leftlen, post, postStart, postStart + leftlen - 1)
        }
        if rightLen > 0 {
            root.right = build(pre, preEnd - rightLen + 1, preEnd, post, postEnd - rightLen + 1, postEnd)
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

