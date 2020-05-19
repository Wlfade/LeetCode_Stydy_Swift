//
//  Solution.swift
//  LeetCode-1185.一周中的第几天
//
//  Created by 单车 on 2020/5/19.
//  Copyright © 2020 单车. All rights reserved.
//
// 给出的日期一定是在 1971 到 2100 年之间的有效日期。
import UIKit

class Solution: NSObject {
    class func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String
    {
        let weekArr = ["Thursday", "Friday", "Saturday","Sunday","Monday","Tuesday", "Wednesday"]
        var days = 0
        for i in 1971..<year {
            if (i % 4 == 0 && i % 100 != 0 || i%400 == 0){
                days += 366;
            }else{
                days += 365
            }
        }
        let monthDays = [31,28,31,30,31,30,31,31,30,31,30,31];
        for i in 0..<month-1 {
            days += monthDays[i]
        }
        days += day
        if ((year % 4 == 0 && year % 100 != 0 || year%400 == 0) && month > 2) {
            days += 1;
        }
        let count = days % 7
        let weekDayStr = weekArr[count]
        return weekDayStr
    }
}
