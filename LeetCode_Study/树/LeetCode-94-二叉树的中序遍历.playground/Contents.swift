//https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
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
    //迭代 -> 层次遍历
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var result: [Int] = []
        var node: TreeNode? = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            
            node = stack.popLast()
            result.append(node!.val)
            node = node?.right
        }
        
        return result
    }
    
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var result: [Int] = []
        var node: TreeNode? = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
                
                var s = "s = ["
                for i in 0..<stack.count{
                    s += "\(stack[i].val), "
                }
                s += "]"
                print(s)
            }
            
            node = stack.popLast()
            result.append(node!.val)
            node = node?.right
        }
        print("result:"+"\(result)")
        return result
    }

}


