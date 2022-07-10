// 25:30
func solution() {
  let _ = Int(readLine()!)!
  let coins = readLine()!.split { $0 == " " }.map { Int($0)! }
  let m = Int(readLine()!)!
  
  var dp = [Int](repeating: 0, count: m + 1)
  for coin in coins {
    var tmp = dp
    if m >= coin { tmp[coin] += 1 }
    for won in 1...m {
      if won >= coin { tmp[won] += tmp[won-coin] }
    }
    dp = tmp
  }
  print(dp[m])
}

for _ in 0..<Int(readLine()!)! {
  solution()
}
