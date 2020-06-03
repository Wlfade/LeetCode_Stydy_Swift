//https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
class Solution {
    func postorder(_ root: Node?) -> [Int] {
        guard root != nil else {
            return []
        }
        var array = [Int]()
        for node in root!.children {
           array += postorder(node)
        }
        array.append(root!.val)

        return array
    }
}



