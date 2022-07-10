// 25:30
func solution() {
  let _ = Int(readLine()!)!
  let coins = readLine()!.split { $0 == " " }.map { Int($0)! }
  let m = Int(readLine()!)!
  
  var dp = [Int](repeating: 0, count: m + 1)
  for coin in coins {
    var tmp = dp
    if m >= coin { tmp[coin] += 1 } // 해당 coin으로 만드는 새로운 방법 추가
    for won in 1...m {
      if won >= coin { tmp[won] += tmp[won-coin] } // 이미 있는 방법에 개수만 더하는 방식이다.
    }
    dp = tmp
  }
  print(dp[m])
}

for _ in 0..<Int(readLine()!)! {
  solution()
}

