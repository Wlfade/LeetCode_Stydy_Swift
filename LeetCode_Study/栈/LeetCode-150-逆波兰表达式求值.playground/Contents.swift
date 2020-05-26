import UIKit
//题目地址 https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/

//https://www.cnblogs.com/zzliu/p/10801113.html // 前缀、中缀、后缀表达式的 定义
class Stack {
    private var array = [Int]();
    func pop() -> Int {
        if array.isEmpty {
            return 0;
        }
        return array.removeLast();
    }
    func push(num: Int) -> Void {
        array.append(num);
//        print(array.description)
        return
    }

}
class Solution {
    /// 逆波兰表达式求值
    func evalRPN(_ tokens: [String]) -> Int {
        let stack = Stack() //创建一个栈
        var sum = 0
        for string : String in tokens{
            if "+-*/".contains(string) {
                let right = stack.pop()
                let left = stack.pop()
                switch string {
                    case "+":
                        sum = left + right;
                        stack.push(num: sum);
                        break;
                    case "-":
                        sum = left - right;
                        stack.push(num: sum);
                        break;
                    case "*":
                        sum = left * right;
                        stack.push(num: sum);
                        break;
                    case "/":
                        sum = left / right;
                        stack.push(num: sum);
                        break;
                    default:
                        break
                    }

                
                
            }
            else{
                stack.push(num: Int(string)!)
            }
        }
        return stack.pop()
    }
}
let solution = Solution()

print(solution.evalRPN(["2","1","+","3","*"]))
