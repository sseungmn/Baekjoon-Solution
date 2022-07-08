let n = Int(readLine()!)!

// i - 1행, j열을 선택했을 때의 최댓값
var dp = [[Int]](repeating: [Int](repeating: 0, count: 505), count: 505)
for i in 0..<n {
  let line = readLine()!.split { $0 == " " }.map { Int($0)! }
  for j in line.indices {
    dp[i + 1][j] = max(
      dp[i][max(0, j-1)],
      dp[i][j]
    ) + line[j]
  }
}
print(dp[n].max()!)
