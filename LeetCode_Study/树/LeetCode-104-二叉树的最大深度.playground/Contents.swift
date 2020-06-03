//https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
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
    // func maxDepth(_ root: TreeNode?) -> Int {
    //     guard root != nil else{
    //         return 0
    //     }
    //     return 1 + max(maxDepth(root?.left),maxDepth(root?.right))
    // }
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var levelSize = 1 //存储每次的元素数量 数组的count
        var height = 0
        var queue = [TreeNode]() //队列数组
        queue.append(root!)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            levelSize -= 1 //数据从数组中移除就 减1
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right{
                queue.append(right)
            }
            if levelSize == 0 {
                levelSize = queue.count
                height += 1
            }
            
        }
        return height
    }

}
