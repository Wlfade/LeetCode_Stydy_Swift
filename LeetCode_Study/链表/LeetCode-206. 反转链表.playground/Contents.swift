//https://leetcode-cn.com/problems/reverse-linked-list/
import UIKit
public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
    }
}
var str = "Hello, playground"
class Solution {
      func reverseList(_ head: ListNode?) -> ListNode? {
      if head == nil || head?.next == nil {
          return head
      }

      let newHead = reverseList(head?.next)
      head?.next?.next = head
      head?.next = nil
      return newHead
     }
    
    /**
     func reverseList(_ head: ListNode?) -> ListNode? {
       if head == nil || head?.next == nil {
           return head
       }
       
        var newHead: ListNode? = ListNode.init(0).next
        var p = head
        while p != nil {
           let tmp = p?.next
           p?.next = newHead
           newHead = p
           p = tmp
        }
       return newHead
     }
     */
}
