let line = readLine()!.split(separator: " ")
let A  = Character("A").asciiValue!
let n = Array(line[0])
  .map { char -> Int in
    guard let num = Int(String(char)) else {
      return Int(char.asciiValue! - A + 10)
    }
    return num
}
let b = Int(line[1])!

var multiplier = 1
var ret = 0
for i in 0..<n.count {
  ret += multiplier * n[n.count - i - 1]
  multiplier *= b
}
print(ret)
