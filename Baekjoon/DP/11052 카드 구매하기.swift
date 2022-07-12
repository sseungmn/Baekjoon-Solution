// 각 개수에 대한 가격의 최댓값은, 이전 가격의 최댓값과 연관이 있다고 볼 수 있다.
// dp[i] = max(p[1] + dp[i-1], p[2] + dp[i-2], ..., p[i])

let n = Int(readLine()!)!
var p = readLine()!.split { $0 == " " }.map { Int($0)! }
var dp = [Int](repeating: 0, count: n+5)
for i in 1...n {
  // i개를 갖기 위해서 지불해야하는 금액의 최댓값
  for j in 1...i {
    dp[i] = max(dp[i], dp[i-j] + p[j-1])
  }
}
print(dp[n])
