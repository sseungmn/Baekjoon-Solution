let N = Int(readLine()!)!
var t = [Int](repeating: 0, count: N+5)
var p = [Int](repeating: 0, count: N+5)
for i in 1...N {
  let line = readLine()!.split { $0 == " " }.map { Int($0)! }
  (t[i], p[i]) = (line[0], line[1])
}

// 뒤에서부터 시작해서
// 현재의 상담이 끝난 날 이후의 값들 중, 최대 금액을 더하면 된다.
// dp[n] = max(dp[n+k], dp[n+k+1], ...,  dp[N])

var dp = [Int](repeating: 0, count: N+5)
var ret = 0
for n in (1...N).reversed() {
  var maxValue = 0
  var k = t[n] // 현재로부터 k일 뒤
  while n + k <= N {
    maxValue = max(maxValue, dp[n+k])
    k += 1
  }
  if n + t[n] - 1 <= N { dp[n] = p[n] + maxValue }
  ret = max(ret, dp[n])
}
print(ret)
