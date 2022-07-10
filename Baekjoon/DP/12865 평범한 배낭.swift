let line = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = line[0], k = line[1]
var dp = [Int](repeating: 0, count: k+1)

for _ in 1...n {
  let line = readLine()!.split { $0 == " " }.map { Int($0)! }
  let w = line[0], v = line[1]
  for bag in stride(from: k, to: 0, by: -1) {
    if w <= bag { dp[bag] = max(dp[bag], dp[bag-w] + v) }
  }
}
print(dp[k])
