//
//  SolutionOne.swift
//  LeetCode_1010
//
//  Created by 单车 on 2020/5/18.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class SolutionOne: NSObject {
   class func numPairsDivisibleBy60(_ time: [Int]) -> Int {
      var count = 0
        if(time.count>=2){
         for i in (0..<time.count - 1){
                for j in (i+1..<time.count ){
                    if((time[i]+time[j])%60 == 0){
                     print("i:\(i)"+"j:\(j)");
                     count += 1
                    }
                }
            }
            return count
        }else{
            return 0
        }
    }
}

