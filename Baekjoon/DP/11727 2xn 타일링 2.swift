// 6:52
let mod = 10_007
let n = Int(readLine()!)!

// 가로 2칸을 채우는 방법 2가지, 가로 1칸을 채우는 방법 1가지
// dp[n] = dp[n-2] * 2 + dp[n-1]

var dp = [Int](repeating: 0, count : n+2)
dp[1] = 1; dp[2] = 3
for i in 0...n {
  if i <= 2 { continue }
  dp[i] = (dp[i-2] * 2 + dp[i-1]) % mod
}
print(dp[n])
