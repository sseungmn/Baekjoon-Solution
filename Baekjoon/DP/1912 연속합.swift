let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }
var dp = [Int](repeating: 0, count: n + 1) // n-1번까지의 최대합
dp[0] = -1000 // 0으로 설정했을 때, 원소들이 모두 음수라면, 0이 최대값이 될 수 있기 때문이다.
for i in arr.indices {
  dp[i+1] = max(dp[i]+Int(arr[i])!, Int(arr[i])!)
}
print(dp.max()!)
