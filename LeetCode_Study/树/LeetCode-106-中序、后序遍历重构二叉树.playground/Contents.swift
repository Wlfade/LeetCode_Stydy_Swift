
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

//class Solution {
//    var dict = [Int: Int]()
//    var post = [Int]()
//
//    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
//
//        for i in (0 ..< inorder.count) {
//            dict[inorder[i]] = i
//        }
//
//        post = postorder
//
//        return buildTreeHelper(0, inorder.count-1, 0, postorder.count-1);
//    }
//
//    func buildTreeHelper(_ i_start: Int, _ i_end:Int, _ po_start: Int, _ po_end:Int) -> TreeNode? {
//
//        if i_end < i_start  || po_end < po_start {
//            return nil
//        }
//
//        let root_val = post[po_end]
//        let root = TreeNode(root_val)
//        //在中序遍历中找到根节点的位置
//        let in_root_index = dict[root_val]!
//
//        let leftNum = in_root_index - i_start
//        //递归的构造左子树
//        root.left = buildTreeHelper(i_start, in_root_index - 1, po_start, po_start + leftNum - 1)
//            //递归的构造右子树
//        root.right = buildTreeHelper(in_root_index + 1, i_end,  po_start + leftNum, po_end - 1)
//
//        return root;
//    }
//}
class Solution {
    
}

extension Solution{
    //
    class func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if
        postorder.count == 0 ||
            
        inorder.count == 0{
            return nil
        }
        return build1(postorder, 0, postorder.count - 1, inorder, 0, inorder.count - 1)
    }
    private class func build1(_ post : [Int] , _ postStart : Int , _ postEnd : Int, _ In : [Int], _ inStart : Int, _ inEnd : Int) -> TreeNode?{
        let root = TreeNode.init(post[postEnd])
        let pos = findRoot1(root.val, In, inStart, inEnd)
        let leftlen = pos - inStart //左子树长度
        let rightLen = inEnd - pos //右子树长度
        if leftlen > 0 {
            root.left = build1(post, postStart , postStart + leftlen - 1, In, inStart, inStart + leftlen - 1)
        }
        if rightLen > 0 {
            root.right = build1(post, postEnd - rightLen, postEnd - 1, In, inEnd - rightLen + 1, inEnd)
        }
        return root
        
    }
    private class func findRoot1(_ rootVal : Int ,_ In : [Int] ,_ inStart : Int , _ inEnd : Int)-> Int{
        for i in inStart...inEnd {
            if In[i] == rootVal {
                return i
            }
        }
        return -1
    }

}
