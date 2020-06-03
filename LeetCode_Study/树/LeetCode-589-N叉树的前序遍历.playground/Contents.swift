//https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
class Solution {
    func preorder(_ root: Node?) -> [Int] {
        guard root != nil else {
            return []
        }
        var array = [Int]()
        array.append(root!.val)
        for node in root!.children {
           array += preorder(node)
        }
        return array
    }
}

