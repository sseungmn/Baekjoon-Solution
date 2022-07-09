// 26:42 -> 3번 연속된 계단을 밟는것에 대한 이해를 잘못 했다.
// dp[n][i] : n번째 칸을 밟았을 때, 한 계단씩 연속으로 오른 횟수가 i인 경우의 최댓값
let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: n+5)
for i in 1...n { arr[i] = Int(readLine()!)! }
var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n+1)
dp[1][0] = arr[1]

for i in 1...n {
  if i <= 1 { continue }
  dp[i][0] = dp[i-2].max()! + arr[i]
  dp[i][1] = dp[i-1][0] + arr[i]
}
print(dp[n].max()!)
