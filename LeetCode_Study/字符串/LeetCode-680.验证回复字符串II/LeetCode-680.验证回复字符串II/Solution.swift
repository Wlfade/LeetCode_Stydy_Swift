//
//  Solution.swift
//  LeetCode-680.验证回复字符串II
//
//  Created by 单车 on 2020/5/19.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class Solution: NSObject {
    class func validPalindrome(_ s: String) -> Bool {
        let arr:[Character] = Array(s)
        var left : Int = 0
        var right: Int = arr.count - 1
        while left < right {
            if arr[left] != arr[right] {
                return isValid(arr, left, right - 1) || isValid(arr, left + 1, right)
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    class func isValid(_ arr:[Character],_ left:Int,_ right:Int)->Bool{
        
        var left = left
        var right = right
        while left < right {
            if arr[left] != arr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
        
    }
}
