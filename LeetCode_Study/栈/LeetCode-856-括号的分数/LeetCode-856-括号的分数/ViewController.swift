//
//  ViewController.swift
//  LeetCode-856-括号的分数
//
//  Created by 王玲峰 on 5/26/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

/**
构建一个栈
如果遇到(就往栈里面添加
如果遇到)就去寻找最近的左括号抵消，同时计算里面的分数
拿(()(()))示例, 栈结构变化如下
[(]                # 遇到 ( 往栈添加
[(, (]             # 继续添加
[(, 1]             # 遇到 ） 合成一个1
[(, 1, (]          # 遇到 ( 往栈添加
[(, 1, (, (]       # 继续添加
[(, 1, (, 1]       # 遇到 ） 合成一个1
[(, 1, 2]          # 遇到 ） ，结构就是（1）， 所以计算的话是 1 * 2
[6]                # 遇到 ） ，结构是（1，2）， 所以计算的话是 （1 + 2） * 2
https://leetcode-cn.com/problems/score-of-parentheses/
*/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let solution = Solution()
        print(solution.scoreOfParentheses("(()(()))"))
        
    }


}

