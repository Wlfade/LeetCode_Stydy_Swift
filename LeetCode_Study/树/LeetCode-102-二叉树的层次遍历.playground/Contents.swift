//https://leetcode-cn.com/problems/binary-tree-level-order-traversal/

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
    func levelOrder(_ root: TreeNode?) -> [[Int]]{
         guard root != nil else {
            return []
        }
        var lastRes = [[Int]]()
        
        var res = [Int]()
        var queue = [TreeNode]()
        queue.append(root!)
        var levelSize = 1 //存储每次的元素数量 数组的count

        while !queue.isEmpty {
            let node = queue.removeFirst()
            levelSize -= 1
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right{
                queue.append(right)
            }
            res.append(node.val)
            if levelSize == 0 {
                levelSize = queue.count
                lastRes.append(res)
                res.removeAll()
            }
        }
        return lastRes
    }
}


