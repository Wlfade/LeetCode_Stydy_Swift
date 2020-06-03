import UIKit

public class TreeNode<T>{
    public var value : T
    
    public weak var parent : TreeNode?
    public var children = [TreeNode<T>]()
    
    public init(value : T){
        self.value = value
    }
    public func addChild(_ node : TreeNode<T>){
        children.append(node)
        node.parent = self
    }
}
//在调试的时候总会发现在输出自定义的类与结构体时,会打印很多不想输出的变量,这就有了CustomStringConvertible,CustomDebugStringConvertible这两个协议的用处.

extension TreeNode:CustomStringConvertible {
    //重写 description 打印方法
    public var description: String{
        var s = "\(value)"
        if !children.isEmpty {
            //map() : 对一个集合类型的所有元素做一个映射操作 遍历
            //OC 中是 makeobjectperformselector
            //$0表示闭包中的第一个参数 ->treeNode
            s += "{" + children.map{ $0.description }.joined(separator: ",") + "}"
        }
        return s
    }
}
//where 对泛型T加以限制
//相等（Equatable）
//
//在面向对象的世界里，总是有一个栈区引用指向堆区的一个对象，相等自然也变得复杂起来。
//(==)默认是比较引用，实现Equatable协议后就是实现协议后的比较
//(===)比较的是引用

extension TreeNode where T:Equatable {
    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}


let tree = TreeNode<String>(value: "beverages")

let hotNode = TreeNode<String>(value: "hot")
let coldNode = TreeNode<String>(value: "cold")

let teaNode = TreeNode<String>(value: "tea")
let coffeeNode = TreeNode<String>(value: "coffee")
let chocolateNode = TreeNode<String>(value: "cocoa")

let blackTeaNode = TreeNode<String>(value: "black")
let greenTeaNode = TreeNode<String>(value: "green")
let chaiTeaNode = TreeNode<String>(value: "chai")

let sodaNode = TreeNode<String>(value: "soda")
let milkNode = TreeNode<String>(value: "milk")

let gingerAleNode = TreeNode<String>(value: "ginger ale")
let bitterLemonNode = TreeNode<String>(value: "bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)

print(tree)

print(teaNode.parent!)
print(blackTeaNode.parent?.parent?.parent!)

