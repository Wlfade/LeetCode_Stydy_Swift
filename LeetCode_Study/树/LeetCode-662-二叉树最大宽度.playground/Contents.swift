//https://leetcode-cn.com/problems/maximum-width-of-binary-tree/
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
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var queue : [TreeNode] = [root!] //队列数组
        var list : [Int] = [1]
        var res = 1 //存储每次的元素数量 数组的count
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count{
                let cur = queue.removeFirst()
                let curIndex = list.removeFirst()
                if cur.left != nil {
                    queue.append(cur.left!)
                    list.append(curIndex * 2)
                    
                }
                if cur.right != nil {
                    queue.append(cur.right!)
                    list.append(curIndex * 2 + 1)
                }
                var s = "list:["
                for i in 0..<list.count{
//                    print(list[i])
                    s += "\(list[i]),"
                }
                
                print(s + "]")
            }
            if list.count >= 2 {
                res = max(res, list.last! - list.first! + 1)
                print("最大宽度：\(res)")
            }
            
        }
        return res
    }
    
    
        func widthOfBinaryTree(_ root: TreeNode?) -> Int {
                guard let root = root else { return 0}
                var queue: [TreeNode] = [root]
                var list: [Int] = [1]
                var maxLen = 1
                while !queue.isEmpty {
                    let size = queue.count
                    for _ in 0..<size {
                        let node = queue.removeFirst()
                        let index = list.removeFirst()
                        if let left = node.left {
                            queue.append(left)
                            list.append(2 &* index)
                        }
                        if let right = node.right {
                            queue.append(right)
                            list.append(2 &* index &+ 1)
                        }
                    }
                    if list.count >= 2 { //注意临界条件是大于等于2，因为count为1宽度也是1
                        maxLen = max(maxLen, list.last! &- list.first! &+ 1)
                    }
                }
            return maxLen
        }


}
