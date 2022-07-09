// dp[i][j] : i번째 순서에 연속으로 마신 횟수
let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n+5)
for i in 1...n {
  let glass = Int(readLine()!)!
  dp[i][0] = dp[i-1].max()!
  dp[i][1] = dp[i-1][0] + glass
  dp[i][2] = dp[i-1][1] + glass
}
print(dp[n].max()!)
