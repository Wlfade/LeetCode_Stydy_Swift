//
//  Solution.swift
//  LeetCode-856-括号的分数
//
//  Created by 王玲峰 on 5/26/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class Solution: NSObject {
    func scoreOfParentheses(_ S: String) -> Int {
        let stack = Stack();
        stack.push(x: 0);
        for char in S {
            if char == "(" {
                stack.push(x: 0);
            } else {
                //如果是 “)”
                let m = stack.pop();
                print("m:\(m)")
                let n = stack.pop();
                print("n:\(n)")
                print(n+max(2*m, 1))
                stack.push(x: n + max(2 * m, 1));
            }
        }
        return stack.pop();
    }
}

