//
//  Solution.swift
//  LeetCode_152
//
//  Created by 单车 on 2020/5/18.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class Solution: NSObject {
    class func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }
        var result : Int = .min
        for i in 0..<nums.count-1 {
            let j = i + 1;
            let temp = nums[i]*nums[j];
            if temp>result {
                result = temp;
            }
        }
        return result;
    }
    
    class func maxProduct1(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }

        var result: Int = .min
        var imin: Int = 1
        var imax: Int = 1

        for i in 0 ..< nums.count {
            if nums[i] < 0 { (imin, imax) = (imax, imin) }

            imax = max(nums[i], imax * nums[i])
            imin = min(nums[i], imin * nums[i])

            result = max(result, imax)
        }

        return result

    }
   
}

