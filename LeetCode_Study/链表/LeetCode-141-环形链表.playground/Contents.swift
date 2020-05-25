//https://leetcode-cn.com/problems/linked-list-cycle/
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
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        var slow = head
        var fast = head?.next
//        while fast != nil && fast?.next != nil {
//            slow = slow?.next
//            fast = fast?.next?.next
//            if (slow == fast) {
//                return true
//            }
//        }
//        return false
        while slow !== fast {
            if fast == nil || fast?.next == nil{
                return false
            }else{
                slow = slow?.next
                fast = fast?.next?.next
            }
        }
        return true
        
    }
}
