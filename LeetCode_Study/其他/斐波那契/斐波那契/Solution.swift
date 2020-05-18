//
//  Solution.swift
//  斐波那契
//
//  Created by 单车 on 2020/5/18.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class Solution: NSObject {
    class func fib1(_ n: Int)->(Int){
        if n<=1{ return n;}
        return fib1(n-1) + fib1(n-2);
    }
    
    class func fib2(_ n: Int)->(Int){
        var first : Int = 0;
        var second : Int = 1;
        for _ in 0..<n-1 {
            let sum = first + second
            first = second
            second = sum
        }
        return second;
            
    }
    class func fib3(_ n: Int)->(Int){
        var m = n
        
        var first : Int = 0;
        var second : Int = 1;
        while (m > 1) {
            second += first
            first = second - first
            m -= 1
        }
        return second;
            
    }
    //线性代数 算 斐波那契
    class func fib4(_ n: Int)->(Int){
        let c : Double = sqrt(5)
        return (Int)(pow((1+c)/2, Double(n))-pow((1-c)/2, Double(n)))
        
    }
}
