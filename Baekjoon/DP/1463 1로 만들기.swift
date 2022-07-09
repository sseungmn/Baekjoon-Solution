// 25:24
// dp[i] = i를 만드는데 사용한 연산의 최소회수
let max = 1_000_000
let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: max+1)

var i = 1
dp[0] = max; dp[1] = 1
while true {
  if i == n { break }
  if dp[i] == 0 { continue }
  if 3*i <= max { dp[3*i] = dp[3*i] == 0 ? dp[i] + 1 : min(dp[3*i], dp[i] + 1) }
  if 2*i <= max { dp[2*i] = dp[2*i] == 0 ? dp[i] + 1 : min(dp[2*i], dp[i] + 1) }
  if i+1 <= max { dp[i+1] = dp[i+1] == 0 ? dp[i] + 1 : min(dp[i+1], dp[i] + 1) }
  i += 1
}
print(dp[n]-1)
