//
//  AVLTree.swift
//  AVL-Tree
//
//  Created by 王玲峰 on 6/3/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit
class AVLNode<T>: NSObject {
    var height : Int = 1
    
    var value : T!
    var left : AVLNode?
    var right : AVLNode?
    var parent : AVLNode?
    
    public init(value : T, parent:AVLNode?){
        self.value = value
        self.parent = parent
    }
    
    /// 是否是根节点
    public var isRoot: Bool {
        return parent == nil
    }
    /// 是否是叶节点
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    /// 是否是左子节点
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    /// 是否是右子节点
    public var isRightChild: Bool {
        return parent?.right === self
    }
    /// 是否有左子节点
    public var hasLeftChild: Bool {
        return left != nil
    }
    /// 是否有右子节点
    public var hasRightChild: Bool {
        return right != nil
    }
    /// 是否有子节点
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    /// 是否左右两个子节点都有
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    /// 当前节点包括子树中的所有节点总数
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    /// 判断自己是不是左子树
    public var beLeftChild: Bool {
        return parent != nil && self == parent?.left
    }
    /// 判断自己是不是右子树
    public var beRightChild: Bool {
        return parent != nil && self == parent?.right
    }
}

extension AVLNode{
    //获取该节点平衡因子
    public func balanceFactor()->Int{
        var leftHeight : Int = 0
        if left != nil{
            leftHeight = left!.height
        }
                
        var rightHeight : Int = 0
        if right != nil{
            rightHeight = right!.height
        }
        return leftHeight - rightHeight
    }
    
    //更新高度
    func updateHeight() {
        var leftHeight : Int = 0
        if left != nil{
            leftHeight = left!.height
        }
                
        var rightHeight : Int = 0
        if right != nil{
            rightHeight = right!.height
        }
        //自身高度加上 左右子树高度中较高的
        height = 1+max(leftHeight, rightHeight)
    }
    
    //获取子节点 高度较高的 子节点
    func tallerChild() -> AVLNode<T> {
        var leftHeight : Int = 0
        if left != nil{
            leftHeight = left!.height
        }
                
        var rightHeight : Int = 0
        if right != nil{
            rightHeight = right!.height
        }
        if leftHeight > rightHeight {
            return left!
        }
        if rightHeight > leftHeight {
            return right!
        }
        //判断自己是 父节点的 左子树 还是右子树 一样的就 返回 同方向的 节点
        return (beLeftChild == true ? left : right)!
    }
}

class AVLTree <T:Comparable> : BinaryTree<T> {
    override init() {
        super.init()
    }
    public convenience init(_ array : [T]){
        precondition(array.count > 0)
        self.init()
        for v in array {
            add(value: v)
        }
    }
    override func test()-> String{
        super.test()
    }
    
    //删除节点后的调整
    override func afterRemove(node:AVLNode<T>?){
        var theNode = node?.parent

        while theNode != nil {
            //如果平衡 这个节点的父节点的 平衡因子 绝对值 小于等于1 就是平衡的
            if isBalanced(node: theNode) {
                //更新高度
                updateHeight(node: theNode!) //更新这个节点的高度 可能是 0-> 1 1->0
            }
            //LL RL LR RL 旋转 平衡高度
            else{
                //更新这个 小单位的 树的高度 发生了变化 1->0  但是 假如 原本这个树对应的另一半的树的高度是2  这样还是 不平衡 所以 不能只是调整一次了 要继续向上遍历 log(n) 次
                //恢复平衡 O(logn)次调整
                rebalance(theNode!)
            }
            theNode = theNode?.parent
        }
    }
}
extension AVLTree{
    //添加节点
    public func add(value : T){
        //传入第一个节点
        if root == nil {
            root = AVLNode<T>(value: value ,parent: nil);
        
            size += 1
            //添加新节点之后的操作
            afterAdd(node: root)
            return
        }
        var node = root
        var parent = root
        var cmp = 0
        while node != nil {
            parent = node //父节点
            cmp = compareTo(t1: (node?.value!)!, t2: value)
            if cmp < 0 {
                node = node?.right
            }else if(cmp > 0){
                node = node?.left
            }else{
                node?.value = value //相等，最好是覆盖掉
                return
            }
        }
        let newNode = AVLNode(value: value, parent: parent)
        if cmp < 0 {
            parent?.right = newNode
        }else{
            parent?.left = newNode
        }
        size += 1
        //添加新节点之后的操作
        afterAdd(node: newNode)

    }
    //是否包含某个元素
    func contains(element : T) ->  Bool{
        return node(element: element) != nil
    }

    //传入元素删除节点
    func remove(element : T?){
        if(elementNotNilCheck(element: element) == false){
              return
            }
        let nod = node(element: element!)
        remove(node: nod)
    }
    //删除节点
    private func remove(node:AVLNode<T>?){
        var node = node
        
        if node == nil {
            return
        }
        size -= 1
        //度为2的节点 的前驱 或者 后继节点 他的度 只能是 1 或者 0
        if (node?.hasBothChildren == true) {
            //找到后继节点
            let s = successor(node: node)
            //用后继节点的值 覆盖 度为2的节点的值
            node?.value = s?.value  //这里其实已经就完成好了
            
            //接下来就是 处理 找到的后继节点的处理了 把 s 交给node 来处理
            //相当于 现在改变目标 删除的是这个 度为1 或者 0 的后继节点
            node = s
        }
        
        //删除node 节点（node 的度必然是1或者0）
        // 获取删除节点的 子节点 如果左节点不为空 就取左 否则取右子节点
        let replaceMent = node?.left != nil ? node?.left : node?.right
        // 度为1 的节点
        //replacement 不为空 说明 这个node的度为1
        if replaceMent != nil {
            //因为要删除了这个节点 所以 要给自己的子节点设置一个父节点 那就是 自己的父节点
            replaceMent?.parent = node?.parent
            //更改parent的left / right 的指向
            //要删除的节点没有父节点 说明删除的是根节点所以要重新设置根节点
            if node?.parent == nil {
                //node 是度为1的节点 并且是根节点
                root = replaceMent
            }else if(node == node?.parent?.left){
                //要删除的节点有父节点 要删除的节点 是父节点的左节点 所以要给父节点的左节点重新找一个子节点那就是他的子节点

                node?.parent?.left = replaceMent
            }else{
                //要删除的节点有父节点 要删除的节点 是父节点的右节点 所以要给父节点的右节点重新找一个子节点那就是他的子节点

                node?.parent?.right = replaceMent
            }
            //删除节点后的调整
            afterRemove(node: node)
        }else if(node?.parent == nil){
            //node 是叶子节点 同时 也是根节点
            root = nil
            //删除节点后的调整
            afterRemove(node: node)
        }else{
            //删除的节点是叶子节点
            //node 是叶子节点，但不是跟节点
            if node == node?.parent?.left {
                //这个节点是父节点的左节点就把父节点的左节点设为空
                node?.parent?.left = nil
            }else{
                //这个节点是父节点的左节点就把父节点的左节点设为空
                node?.parent?.right = nil
            }
            //删除节点后的调整
            afterRemove(node: node)
        }
    }

    //传入元素获取前序元素
    func predecessor(element : T) -> T? {
        if(elementNotNilCheck(element: element) == false){
            return nil
        }
        let nod = node(element: element)
        guard nod != nil else{
            return nil
        }
        let preNode = predecessor(node: nod)
        
        return preNode?.value
    }
    
    //传入元素获取后序元素
    func successor(element : T) -> T? {
        if(elementNotNilCheck(element: element) == false){
            return nil
        }
        let nod = node(element: element)
        guard nod != nil else{
            return nil
        }
        let sucNode = successor(node: nod)
        
        return sucNode?.value
    }


}
//节点功能
extension AVLTree{
    //节点元素比较
    private func compareTo(t1 : T,t2 : T) -> Int{
        var cmp : Int
        if t1 < t2 {
            cmp = -1
        }else if (t1 > t2){
            cmp = 1
        }else{
            cmp = 0
        }
        return cmp
    }

    //检测传入的元素是否为空
    private func elementNotNilCheck(element : T?)->Bool{
        if element == nil {
            print("element must not nil")
            return false
        }
        return true
    }
    //根据元素获取节点
    private func node(element : T) -> AVLNode<T>? {
        if(elementNotNilCheck(element: element) == false){
            return nil
        }
        
        var node = root
        while node != nil {
            let cmp = compareTo(t1: element, t2: node!.value)
            if(cmp < 0){
                node = node?.left
            }else if(cmp > 0){
                node = node?.right
            }else{
                return node
            }
        }
        return nil
    }
}

extension AVLTree{
    //添加node之后的调整
    func afterAdd(node : AVLNode<T>?){
        //如果添加的节点的父节点 不为空 就进入循环
        var theNode = node?.parent
        while theNode != nil {
            //如果平衡 这个节点的父节点的 平衡因子 绝对值 小于等于1 就是平衡的
            if isBalanced(node: theNode) {
                //更新高度
                updateHeight(node: theNode!) //更新这个节点的高度 可能是 0-> 1 1->0
            }
            //LL RL LR RL 旋转 平衡高度
            else{
                //这个时候 新加入的节点 引起父节点的不平衡 但是这个方法 会依次遍历向上找 到找到的第一个不平衡点 就是 平衡因子为2 的点 处理这个就可以了 所以 完成 依次之后就可以 跳出循环了 break
                //就拿到了 新加入节点的 grand 节点
                //恢复平衡  需要 O(1)次调整
                rebalance(theNode!)
                break
            }
            theNode = theNode?.parent
        }
    }
    
    
    //创建一个节点
    func createNode(_ value : T ,_ parent : AVLNode<T>) -> AVLNode<T>{
        return AVLNode<T>(value: value, parent: parent)
    }
    
    //更新高度
    func updateHeight(node : AVLNode<T>){
        node.updateHeight()
    }
    
    //新加入的 节点的 爷爷级别的节点
    //恢复·平衡
    //判断传入节点是否平衡 (平衡因子的绝对值 <= 1)
    func isBalanced(node : AVLNode<T>?) -> Bool {
        return abs((node?.balanceFactor())!) <= 1
    }
}
//rebalance 恢复平衡
extension AVLTree{
    func rebalance(_ grand : AVLNode<T>){
        print(self.levelOrder(root))
        print("原高度：\(self.height1())")
        print("---------")
        //获取高度较高的 子节点
        let parent = grand.tallerChild()
        let node = parent.tallerChild()
        if parent.isLeftChild { //L
            if node.isLeftChild { //LL
                rotateRight(grand)
            }else{ //LR
                rotateLeft(parent)
                rotateRight(grand)
            }
        }else{ //R
            if node.isLeftChild { //RL
                rotateRight(parent)
                rotateLeft(grand)
            }else{ //RR
                rotateLeft(grand)
            }
        }
    }
    
    func rebalance2(_ grand : AVLNode<T>){
        print(self.levelOrder(root))
        print("原高度：\(self.height1())")
        print("---------")
        //获取高度较高的 子节点
        let parent = grand.tallerChild()
        let node = parent.tallerChild()
        if parent.isLeftChild { //L
            if node.isLeftChild { //LL
                rotate(grand, node, node.right, parent, parent.right, grand)
            }else{ //LR
                rotate(grand, parent, node.left, node, node.right, grand)
            }
        }else{ //R
            if node.isLeftChild { //RL
                rotate(grand, grand, node.left, node, node.right, node)
            }else{ //RR
                rotate(grand, grand, parent.left, parent, node.left, node)
            }
        }
    }

}

//节点的旋转
extension AVLTree{
    //左旋转
    func rotateLeft(_ grand : AVLNode<T>){
        let parent = grand.right
        let child = parent?.left
        grand.right = child
        parent?.left = grand
        afterRatate(grand, parent, child)
    }
    //右旋转
    func rotateRight(_ grand : AVLNode<T>){
        let parent = grand.left
        let child = parent?.right
        grand.left = child
        parent?.right = grand
        afterRatate(grand, parent, child)
    }
    
    func afterRatate(_ grand : AVLNode<T>!,_ parent : AVLNode<T>!, _ child : AVLNode<T>?){
        //让parent 成为子树的根节点
        if grand.isLeftChild {
            parent.parent = grand!.parent

            grand.parent?.left = parent
        }else if grand.isRightChild{
            parent.parent = grand!.parent

            grand.parent?.right = parent
        }else{
            root = parent
        }
        if child != nil {
            child?.parent = grand
        }
        
        grand.parent = parent
        //更新高度
        //现在grand 是parent 的子节点 所以 从下往上 更新高度
        updateHeight(node: grand)
        
        updateHeight(node: parent)
        
        print(self.levelOrder(root))
        print("新高度：\(self.height1())")

    }
}
//旋转的统一处理
extension AVLTree{
        func rotate (
            _ r : AVLNode<T>?,
            _ b : AVLNode<T>!,_ c : AVLNode<T>?,
            _ d : AVLNode<T>!,
            _ e : AVLNode<T>?,_ f : AVLNode<T>!){
            //让d成为这棵子树的根节点
            d.parent = r?.parent
            if (r?.isLeftChild == true) {
                r?.parent?.left = d
            }else if(r?.isRightChild == true){
                r?.parent?.right = d
            }else{
                root = d
            }
            b.right = c
            if c != nil {
                c?.parent = b
            }
            updateHeight(node: b)

            f.left = e
            if e != nil {
                e?.parent = f
            }
            updateHeight(node: f)

            d.left = b
            d.right = f
            b.parent = d
            f.parent = d
            updateHeight(node: d)

        }
        
    //    func rotate (
    //    _ r : AVLNode<T>?,
    //    _ a : AVLNode<T>?, _ b : AVLNode<T>!,_ c : AVLNode<T>?,
    //    _ d : AVLNode<T>!,
    //    _ e : AVLNode<T>?,_ f : AVLNode<T>!,_ g : AVLNode<T>?){
    //        //让d成为这棵子树的根节点
    //        d.parent = r?.parent
    //        if (r?.isLeftChild == true) {
    //            r?.parent?.left = d
    //        }else if(r?.isRightChild == true){
    //            r?.parent?.right = d
    //        }else{
    //            root = d
    //        }
    //        b.left = a
    //        if a != nil {
    //            a?.parent = b
    //        }
    //
    //        b.right = c
    //        if c != nil {
    //            c?.parent = b
    //        }
    //        updateHeight(node: b)
    //
    //        f.left = e
    //        if e != nil {
    //            e?.parent = f
    //        }
    //        f.right = g
    //        if g != nil {
    //            g?.parent = f
    //        }
    //
    //        updateHeight(node: f)
    //
    //        d.left = b
    //        d.right = f
    //        b.parent = d
    //        f.parent = d
    //        updateHeight(node: d)
    //    }

}
