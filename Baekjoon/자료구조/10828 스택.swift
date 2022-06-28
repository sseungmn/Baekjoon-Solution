struct Stack {
  var _stack = [Int]()

  mutating func push(_ num: Int) {
    _stack.append(num)
  }

  mutating func pop() -> Int {
    return _stack.isEmpty ? -1 : _stack.removeLast()
  }

  var isEmpty: Int {
    return _stack.isEmpty ? 1 : 0
  }

  var size: Int {
    return _stack.count
  }

  var top: Int {
    return _stack.isEmpty ? -1 : _stack.last!
  }
}

func solution() {
  let n = Int(readLine()!)!
  var stack = Stack()

  (0..<n).forEach { _ in
    if let line = readLine()?.split(separator: " ") {
      switch line[0] {
      case "push": stack.push(Int(line[1])!)
      case "pop": print(stack.pop())
      case "size": print(stack.size)
      case "empty": print(stack.isEmpty)
      case "top": print(stack.top)
      default: fatalError("일치하는 명령이 존재하지 않습니다.")
      }
    }
  }
}

solution()
