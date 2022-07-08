let n = Int(readLine()!)!

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n+1)
for i in 0..<n {
  let line = readLine()!.split { $0 == " " }.map { Int($0)! }
  for j in 0..<3 {
    dp[i + 1][j] = min(
      dp[i][(j + 1) % 3] + line[j],
      dp[i][(j + 2) % 3] + line[j]
    )
  }
}
print(dp[n].min()!)
