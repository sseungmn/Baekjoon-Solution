let line = readLine()!.split { $0 == " " }.map { Int($0)! }
let N = line[0], M = line[1]
let m = readLine()!.split { $0 == " " }.map { Int($0)! }
let c = readLine()!.split { $0 == " " }.map { Int($0)! }

var dp = [Int](repeating: 0, count: 10001)

var ret = 10001
for i in 0..<N {
  for j in (0...10000).reversed() where j >= c[i] {
    dp[j] = max(dp[j - c[i]] + m[i], dp[j])
    if dp[j] >= M { ret = min(ret, j) }
  }
}
print(ret)
