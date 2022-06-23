func solution(_ num: Int) -> String {
  var ret = ""
  var stack = [Int]()
  var curMax = 0
  for i in 0..<num {
    var cur = Int(readLine()!)!
    if curMax < cur {
      for j in curMax+1...cur {
        stack.append(j)
        ret += "\(j): +\n"
      }
      stack.removeLast()
      ret += "\(cur): -\n"
      curMax = cur
    } else {
      if let top = stack.popLast(), top != cur { return "NO" }
      ret += "\(cur): -\n"
    }
  }
  return ret
}

let num = Int(readLine()!)!
print(solution(num))
