// 13:10
// dp[i][j] : i번째 수에 j를 택했을 때의 경우의 수
let mod = 1_000_000_000
let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n+5)

for i in 0..<n {
  for j in 0..<10 {
    if i == 0 { if j != 0 { dp[i][j] = 1 }; continue }
    if j-1 >= 0 { dp[i][j] += dp[i-1][j-1] }
    dp[i][j] %= mod
    if j+1 < 10 { dp[i][j] += dp[i-1][j+1] }
    dp[i][j] %= mod
  }
}
var ret = 0
for i in 0..<10 { ret += dp[n-1][i]; ret %= mod }
print(ret)
