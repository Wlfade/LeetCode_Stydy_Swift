//
//  ViewController.swift
//  LeetCode-1185.一周中的第几天
//
//  Created by 单车 on 2020/5/19.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Solution.dayOfTheWeek(19, 5, 2020))
//        data()
//        CalendarT()
//        dataCompare()
        
//        print(SolutionTw.dayOfTheWeek(1, 1, 1971))

    }
    
    func data(){
        let now = Date()
        
        //5分钟前的date
        let fiveMAge = Date(timeIntervalSinceNow: -5 * 60)
        let fiveMlater = Date(timeIntervalSinceNow: 5 * 60)
        
        //相对于参考时间
        let first = Date(timeIntervalSinceReferenceDate: -875_602_800)
        let second = Date(timeIntervalSinceReferenceDate: 875_602_800)
        
        //获得一年的秒数
        let oneYear = TimeInterval(60 * 60 * 24 * 365)
        let new1971 = Date(timeIntervalSince1970: oneYear)
        let new1969 = Date(timeIntervalSince1970: -oneYear)
        
        //相对于指定时间
        let newYear = Date(timeInterval: oneYear, since: now)
    }
    
    func CalendarT(){
        //创建当前日历 日历系统，这个值默认是gregorian。
        let userCalendar = Calendar.init(identifier: .gregorian)
        
        let components = DateComponents(calendar: nil,
                                        timeZone: nil,
                                        era: nil,
                                        year: 2000,
                                        month: 3,
                                        day: 10,
                                        hour: nil,
                                        minute: nil,
                                        second: nil,
                                        nanosecond: nil,
                                        weekday: nil,
                                        weekdayOrdinal: nil,
                                        quarter: nil,
                                        weekOfMonth: nil,
                                        weekOfYear: nil,
                                        yearForWeekOfYear: nil)
        
        //创建出date
        let userDate = userCalendar.date(from: components)
        //获得相对秒数
        print("1:\(userDate?.timeIntervalSinceReferenceDate)")
        
        
        //另外一种方式
        var components2 = DateComponents()
        components2.year = 2000
        components2.month = 3
        components2.day = 10
        let userDate2 = userCalendar.date(from: components2)
        print("2:\(userDate2?.timeIntervalSinceReferenceDate)")

        //通过date获得组件
        let date2 = Date()
        let com2 = userCalendar.dateComponents([.year, .month,.day,.hour], from: date2)
        com2.year
        com2.month
        com2.day
        com2.hour
        print("year:\(com2.year)month:\(com2.month)day:\(com2.day)hour:\(com2.hour)")
        
        
        //date -> string
        let myFormatter = DateFormatter()
        //这里有很多默认的日期格式
        myFormatter.dateStyle = .long
        //默认的时间格式
        myFormatter.timeStyle = .long
        myFormatter.string(from: date2)
        print("date2:\(date2)")
        //也可以使用自定义的格式
        myFormatter.dateFormat = "MMM d, yyyy, hh:mm a zz"
        myFormatter.string(from: date2)
        print("date2:\(date2)")
        //string -> date
        let date = myFormatter.date(from: "May 18, 2017, 03:50 PM GMT+8")
        print("date:\(date)")
    }
    func dataCompare(){
        let userCalendar = Calendar.init(identifier: .gregorian)

        var component1 = DateComponents()
        component1.year = 2001
        component1.month = 1
        component1.day = 9
        component1.hour = 10
        //时区
        component1.timeZone = TimeZone(abbreviation: "PST")
        let date1 = userCalendar.date(from: component1)

        var formatter = DateFormatter()
        formatter.calendar = userCalendar
        formatter.dateFormat = "MMM d, yyyy, hh:mm a zz"
        let date22 = formatter.date(from: "Jan 27, 2010, 10:00 AM PST")

        //可以直接使用> < ==比较
        date1! > date22!
        print(date1! > date22!)
        
        //两个日期的间隔秒数
        date1!.timeIntervalSince(date22!)
        print(date1!.timeIntervalSince(date22!))

        //比较两个日期的天数
        let between = userCalendar.dateComponents([.year], from: date1!, to: date22!)
        between.year
        print(between.year)
        //在date1的基础上，增加90天
        userCalendar.date(byAdding: .day, value: 90, to: date1!)
        print(userCalendar.date(byAdding: .day, value: 90, to: date1!))
        //在date1基础上，增加日期组件后的date
        var com = DateComponents()
        com.hour = 4
        com.minute = 4
        userCalendar.date(byAdding: com, to: date1!)
        print(userCalendar.date(byAdding: com, to: date1!))
    }


}

