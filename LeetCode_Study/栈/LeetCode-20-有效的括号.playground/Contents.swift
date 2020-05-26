//https://leetcode-cn.com/problems/valid-parentheses/
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack:[String] = []
        for c in s {
            if  c == "(" ||
                c == "{" ||
                c == "[" {
                stack.append(String(c))
            }else{
                if stack.isEmpty {
                    return false
                }
                let left = stack.popLast()
                if left == "(" && c != ")" {return false}
                if left == "[" && c != "]" {return false}
                if left == "{" && c != "}" {return false}
            }
        }
        return stack.isEmpty
    }
    //方法二
//    func isValid(_ s: String) -> Bool {
//        var stack:[String] = []
//        let paren_map = [")":"(", "]":"[", "}":"{"]
//        for char in s {     //遍历每个字符串
//            if paren_map.values.contains(char.description) {  //判断是否为左括号
//                stack.append(char.description)          //入栈
//            }else if paren_map[char.description] != stack.popLast() {
//                // paren_map[char.description] 根据 传入的右括号 为Key 取出Value 是否 与 popLast 一致
//                //判断是否与栈顶元素相同，并出栈
//                return false                //如果不同，说明括号无效
//            }
//        }
//        return stack.count == 0
//    }
    
}


let string1 = "{}"

let solution = Solution()

solution.isValid(string1)




