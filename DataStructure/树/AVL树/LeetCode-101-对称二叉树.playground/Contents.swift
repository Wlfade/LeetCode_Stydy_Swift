class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        return subIsSymmetric(root, root)
    }
    
    func subIsSymmetric(_ leftRoot: TreeNode?, _ rightRoot : TreeNode?) -> Bool
    {
        if leftRoot == nil && rightRoot == nil
        {
            return true
        }
        else if (leftRoot != nil && rightRoot != nil)
        {
            return leftRoot?.val == rightRoot?.val
                && (subIsSymmetric(leftRoot?.left, rightRoot?.right))
                && (subIsSymmetric(leftRoot?.right, rightRoot?.left))
        }
 
        return false
    }
}

作者：colinpian
链接：https://leetcode-cn.com/problems/symmetric-tree/solution/swiftjian-dan-jie-by-colinpian/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
