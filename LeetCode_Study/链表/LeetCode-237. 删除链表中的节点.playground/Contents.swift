//https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
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
    func deleteNode(_ node: ListNode?) {
        node?.val = (node?.next!.val)!
        node?.next = node?.next?.next
    }
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
soultion.deleteNode(listNode3)

print(listNode1.val,listNode2.val,listNode3.val,listNode4.val)






