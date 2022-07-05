// 16:09
// n이 주어졌을 때
// n - 1 을 구해서, 한 줄씩 반복하며 3번 붙여넣는다.
func recursive(_ n: Int) -> [String] {
  if n == 1 { return ["*"] }
  let norm = recursive(n / 3)
  var ret = [String]()
  var first = [String]()
  var second = [String]()
  for i in 0..<n/3 {
    first.append(String(repeating: norm[i], count: 3))
    second.append("\(norm[i])\(String(repeating: " ", count: n/3))\(norm[i])")
  }
  ret.append(contentsOf: first)
  ret.append(contentsOf: second)
  ret.append(contentsOf: first)
  return ret
}

print(recursive(Int(readLine()!)!).joined(separator: "\n"))
