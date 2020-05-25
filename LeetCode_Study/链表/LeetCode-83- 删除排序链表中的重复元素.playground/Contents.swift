//https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var cur = head
        while cur != nil && cur?.next != nil {
            if cur?.val == cur?.next?.val {
                cur?.next = cur?.next?.next
            }else{
                cur = cur?.next
            }
        }
        return head
    }
    func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil{
            return head
        }
        else{
            var p = head
            var q = head?.next
            while p?.next != nil {
                if p?.val == q?.val {
                    if q?.next == nil {
                        p?.next = nil
                    }else{
                        p?.next = q?.next
                        q = q?.next
                    }
                }else{
                    p = p?.next
                    q = q?.next
                }
            }
            return head
        }
    }
    
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        var cur = head
        
        if (cur == nil) || cur?.next == nil {
            return cur
        }
        cur?.next = deleteDuplicates2(cur?.next)
        if cur?.next?.val == cur?.val {
            cur = cur?.next
        }
        return cur
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

list0.head = solution.deleteDuplicates2(list1)

print(list0.description)

