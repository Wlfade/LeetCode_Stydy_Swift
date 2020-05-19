//
//  SolutionTwo.swift
//  LeetCode-1185.一周中的第几天
//
//  Created by 单车 on 2020/5/19.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class SolutionTwo: NSObject {
    class func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String
    {
        var userCalendar = Calendar.init(identifier: .gregorian)
        userCalendar.locale = NSLocale(localeIdentifier: "zh_CN") as Locale
        userCalendar.timeZone = NSTimeZone(abbreviation: "EST")! as TimeZone
        userCalendar.timeZone = NSTimeZone(forSecondsFromGMT: +28800) as TimeZone
        
        var component1 = DateComponents()
        component1.year = year
        component1.month = month
        component1.day = day
//        NSTimeZone.init(name:"Asia/Shanghai")
        let userDate2 = userCalendar.date(from: component1)
        
        let com2 = userCalendar.dateComponents([.year, .month,.day,.hour, .weekday], from: userDate2!)

//        let week = getWeek(com2.weekday)
        let weekStr = getWeek(week: com2.weekday!)
        
        return weekStr
    }
     //匹配
    class func getWeek(week:Int)->(String) {
        //1.制作表：
        let arr = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
        return arr[week-1]
    }
}
