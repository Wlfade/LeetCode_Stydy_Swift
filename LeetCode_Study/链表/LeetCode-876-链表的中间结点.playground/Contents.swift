//https://leetcode-cn.com/problems/middle-of-the-linked-list/
import UIKit
public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
    }
}
public class LinkedList {
    public typealias Node = ListNode

    var head: Node?

}
extension LinkedList: CustomStringConvertible {
    /// 可读的输出
    public var description: String {
        var s = "["
        var node = self.head
        while node != nil {
            s += "\(node!.val)"
            node = node!.next
            if node != nil { s += ", "}
        }
        return s + "]"
    }
}


class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fast = head, slow = head
        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next
            slow = slow?.next
        }
        return slow
    }
}
var list0 = LinkedList()

let list1 = ListNode(1)
let list2 = ListNode(1)
let list3 = ListNode(3)
let list4 = ListNode(4)

list0.head = list1
list1.next = list2
list2.next = list3
list3.next = list4

print(list0.description)

let solution = Solution()

let middleNode = solution.middleNode(list0.head)
list0.head = middleNode
print(list0.description)

