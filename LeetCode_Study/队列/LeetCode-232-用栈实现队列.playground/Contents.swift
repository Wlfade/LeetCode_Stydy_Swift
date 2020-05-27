import UIKit
//https://leetcode-cn.com/problems/implement-queue-using-stacks/submissions/
//class Stack<T>{
//    private var array = [T?]();
//    func pop() -> T?{
//        if array.isEmpty {
//            return nil;
//        }
//        return array.removeLast();
//    }
//    func push(x: T) -> Void {
//        array.append(x);
//        return
//    }
//    func isEmpty() -> Bool {
//        return array.isEmpty
//    }
//    func peek() -> T?{
//        return array.first ?? nil
//    }
//
//}
//
//class MyQueue<T> {
//
//    var inStack : Stack = Stack<T>()
//    var outStack : Stack = Stack<T>()
//
//    init() {
//        inStack = Stack<T>()
//        outStack = Stack<T>()
//    }
//
//    /** Push element x to the back of queue. */
//    func push(_ x: T) {
//        inStack.push(x: x)
//    }
//
//    /** Removes the element from in front of queue and returns that element. */
//    func pop() -> T?{
//        checkOutStack()
//        return outStack.pop()
//    }
//
//    /** Get the front element. */
//    func peek() -> T?{
//
//        checkOutStack()
//        return outStack.peek()
//    }
//
//    /** Returns whether the queue is empty. */
//    func empty() -> Bool {
//        return inStack.isEmpty() && inStack.isEmpty()
//    }
//
//    private func checkOutStack(){
//        if outStack.isEmpty() {
//            while !inStack.isEmpty() {
//                outStack.push(x: inStack.pop()!)
//            }
//        }
//    }
//}

struct Stack<Element> {
    fileprivate var array: [Element] = []

    mutating func push(_ element: Element) {
        array.append(element)
    }

    mutating func pop() -> Element {
        return array.popLast()!
    }

    func peek() -> Element {
        return array.last!
    }
    
    func size() -> Int {
        return array.count
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}

class MyQueue {

    var stackA = Stack<Int>()
    var stackB = Stack<Int>()
    
    func transfer() {
        if stackA.isEmpty() {
            while !stackB.isEmpty() {
                stackA.push(stackB.pop())
            }
        }
    }
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stackB.push(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        transfer()
        return stackA.pop()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        transfer()
        return stackA.peek()
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stackA.isEmpty() && stackB.isEmpty()
    }
}


