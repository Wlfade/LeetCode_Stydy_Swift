 //https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree/
 public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
         self.children = []
    }
}
class Solution {
    func maxDepth(_ root: Node?) -> Int {
        if root == nil {
            return 0
        }
        var levelSize = 1 //存储每次的元素数量 数组的count
        var height = 0
        var queue = [Node]() //队列数组
        queue.append(root!)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            levelSize -= 1 //数据从数组中移除就 减1
            for childnode in node.children {
                queue.append(childnode)
            }
            
            if levelSize == 0 {
                levelSize = queue.count
                height += 1
            }
            
        }
        return height

    }
}
