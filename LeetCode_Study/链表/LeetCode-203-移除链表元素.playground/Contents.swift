import UIKit

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
            var head = head //swift中传值为let不可变,所以转为var可变
            while head != nil && head?.val == val {
                head = head?.next
            }
            if head == nil {
                return head
            }
            var p: ListNode = head!
            while p.next != nil {
                if p.next?.val == val {
                    p.next = p.next?.next
                } else {
                    p = p.next!
                }
            }
            return head
    }
    
    
//    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
//        let head = head //swift中传值为let不可变,所以转为var可变
//        if head == nil {
//            return head
//        }
//        head?.next = removeElements(head?.next, val)
//        if head?.val == val {
//            return head?.next
//        } else {
//            return head
//        }
//    }
    /**
     作者：guo-hai-3
     链接：https://leetcode-cn.com/problems/remove-linked-list-elements/solution/yi-chu-lian-biao-yuan-su-by-guo-hai-3/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */

}

let val1 = 4
let val2 = 5
let val3 = 1
let val4 = 9
var listNode1 = ListNode(val1)
var listNode2 = ListNode(val2)
var listNode3 = ListNode(val3)
var listNode4 = ListNode(val4)
listNode1.next = listNode2
listNode2.next = listNode3
listNode3.next = listNode4

print(listNode1.val,listNode2.val,listNode3.val,listNode4.val)

let soultion = Solution()
soultion.removeElements(listNode1,1)

print(listNode1.val,listNode2.val,listNode3.val,listNode4.val)

