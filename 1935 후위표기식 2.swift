import Foundation

func solution(_ operands: [Int], _ expression: String) -> Double {
  var stack = [Double]()
  expression.forEach { char in
    if char.isUppercase {
      let capitalA: UInt8 = 65
      let index = Int(char.asciiValue! - capitalA)
      let num = operands[index]
      stack.append(Double(num))
    }
    else {
      let num2 = stack.popLast()!
      let num1 = stack.popLast()!
      stack.append(operation(num1, num2, char))
    }
  }
  return stack.last!
}

func operation(_ num1: Double, _ num2: Double, _ operator: Character) -> Double {
  print("\(num1) \(`operator`) \(num2)")
  switch `operator` {
  case "+": return num1 + num2
  case "-": return num1 - num2
  case "*": return num1 * num2
  case "/": return num1 / num2
  default: fatalError()
  }
}

let num = Int(readLine()!)!
let expression = readLine()!
var operands = [Int]()
for _ in 0..<num { operands.append(Int(readLine()!)!) }
let ret = String(format: "%.2f", solution(operands, expression))
print(ret)
