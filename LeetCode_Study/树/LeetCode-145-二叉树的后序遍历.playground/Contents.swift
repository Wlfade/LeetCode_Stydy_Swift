//https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
/**
 还是while循环 将所有的左节点取出放入栈（数组）中 一直到左节点为空 nil
 取出栈的第一个元素 就是 最后左子节点的叶节点
 判断 这个节点 是否有 右子节点 没有 将值取出放入到 结果数组中 然后将这个 栈（数组）移除最后一个元素
 继续进行外面的大循环 因为 stack 不为空 里面有很多的 左子节点
 继续取出最后一个 判断有没有 右子节点呢 有 将右子节点取出 node 赋值为这个右子节点 同时将这个 还在 数组中的节点的右子节点 设为nil (方式下次循环出现问题
 node 不为空 就开始了里面的 小的 while 循环 就 把这个节点所有左节点取出了 放到数组中 （我们假设 这个 刚刚拿到的 右子节点没有子节点了 ）所以 小的while 就走一次 node = nil
 取出 stack 中的 最后一个节点 它没有右节点 就取出值放到结果数组中
 然后就依次走这个循环 就完成了

 */
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
//    func postOrderTraversal(_ root: TreeNode?) -> [Int] {
//        guard root != nil else {
//            return []
//        }
//        var array = [Int]()
//        array += postOrderTraversal(root?.left)
//        array += postOrderTraversal(root?.right)
//        array.append(root!.val)

//
//        return array
//    }
    //迭代 -> 层次遍历
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var result: [Int] = []
        var node: TreeNode? = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            let temp = stack.last!
            if temp.right == nil {
                //右边的节点为nil才赋值
                stack.removeLast()
                result.append(temp.val)
            }else{
                node = temp.right
                temp.right = nil
            }
            
        }
        
        return result
    }
    
    func postorderTraversal1(_ root: TreeNode?) -> [Int] {
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
            let temp = stack.last!
            if temp.right == nil {
                //右边的节点为nil才赋值
                stack.removeLast()
                result.append(temp.val)
            }else{
                node = temp.right  //找到了这个节点的有节点之后 就把右节点置空
                temp.right = nil
            }
            
        }
        
        return result
    }

}



