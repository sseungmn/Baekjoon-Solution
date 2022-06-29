// x % 3 == 0 { x /= 3 }
// x % 2 == 0 { x /= 2 }
// x - 1

let n = Int(readLine()!)!

var dp = [Int](repeating: n, count: n+1)
dp[1] = 0

for i in 1...n {
  if i + 1 <= n { dp[i + 1] = min(dp[i + 1], dp[i] + 1) }
  if 2 * i <= n { dp[2 * i] = min(dp[2 * i], dp[i] + 1) }
  if 3 * i <= n { dp[3 * i] = min(dp[3 * i], dp[i] + 1) }
}

var target = n
var ret = [target]
while target != 1 {
  var minIndex = 0
  var min = n
  if target % 3 == 0 { if min > dp[target / 3] { min = dp[target / 3]; minIndex = target / 3 } }
  if target % 2 == 0 { if min > dp[target / 2] { min = dp[target / 2]; minIndex = target / 2 } }
  if min > dp[target - 1] { min = dp[target - 1]; minIndex = target - 1 }
  target = minIndex
  ret.append(minIndex)
}
print(dp[n])
print(ret.map { String($0) }.joined(separator: " "))
