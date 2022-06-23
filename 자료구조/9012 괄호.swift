func solution(_ line: String) -> String {
  var stackSize = 0
  for char in line {
    if char == "(" { stackSize += 1 }
    else if char == ")" {
      if stackSize != 0 { stackSize -= 1 }
      else { return "NO" }
    }
  }
  return stackSize == 0 ? "YES" : "NO"
}

func main() {
  let t = Int(readLine()!)!
  for _ in 0..<t {
    if let line = readLine() {
      print(solution(line))
    }
  }
}

main()
