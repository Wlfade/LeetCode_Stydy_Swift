//
//  Stack.swift
//  LeetCode-856-括号的分数
//
//  Created by 王玲峰 on 5/26/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class Stack: NSObject {
    private var array = [Int]();
    func pop() -> Int {
        if array.isEmpty {
            return 0;
        }
        return array.removeLast();
    }
    func push(x: Int) -> Void {
        array.append(x);
        print(array.description)
        return
    }

}
