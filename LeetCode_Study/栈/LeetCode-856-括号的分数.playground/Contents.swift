import UIKit

class Stack {
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

class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        let stack = Stack();
        stack.push(x: 0); //先插入一个0
        for char in S {
            if char == "(" {
                stack.push(x: 0); //如果是“（” 插入0
            } else {
                let m = stack.pop(); //取出 2个 
                let n = stack.pop();
                stack.push(x: n + max(2 * m, 1));
            }
        }
        return stack.pop();
    }
}

let solution = Solution()
solution.scoreOfParentheses("(()(()))")


