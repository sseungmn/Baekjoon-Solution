import Foundation

func solution1(_ expression: [Character]) -> Int {
  var ret = 0
  var stick = 0
  for i in 0..<expression.count {
    if expression[i] == "(" {
      stick += 1
    } else {
      if expression[i - 1] == "(" { // razer
        stick -= 1
        ret += stick
      } else {
        stick -= 1
        ret += 1
      }
    }
  }
  return ret
}

func solution2(_ expression: String) -> Int {
  var ret = 0
  var stick = 0
  expression.forEach { char in
    switch char {
    case "*": ret += stick
    case "(": stick += 1
    case ")": stick -= 1; ret += 1
    default: fatalError()
    }
  }
  return ret
}

let line = readLine()!
let expression1 = Array(line)
print(solution1(expression1))

let expression2 = line.replacingOccurrences(of: "()", with: "*")
print(solution2(expression2))
