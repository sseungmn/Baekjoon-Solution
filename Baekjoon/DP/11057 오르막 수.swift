// 이전 항과 다음항이 관계를 가지려면 어떤 일반항을 설정해야 할지 생각해보았다.
// 이 문제에서 제약조건은, 인접한 수가 오름차순이어야 한다는 점이다.
// 그렇다면 인접한 수가 무엇이냐에 따라서 다음 수가 무엇이 될 수 있을지 정해진다.
// 수의 길이 n과, 마지막 수 k를 이용해 점화식을 세울 수 있다.
// dp[n][k] = dp[n-1][k] + dp[n-1][k-1] + ... + dp[n-1][0]
let mod = 10_007
let N = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N+5)

for n in 1...N {
  for k in 0..<10 {
    if n == 1 { dp[n][k] = 1; continue }
    for i in 0...k {
      dp[n][k] += dp[n-1][i]
      dp[n][k] %= mod
    }
  }
}

print(dp[N].reduce(0, +) % mod)
