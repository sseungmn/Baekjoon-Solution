// 17:25
// dp[i] : i번째 원소를 마지막으로 하는 lis의 길이
let n = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { Int($0)! }
var ldp = [Int](repeating: 0, count: n)
var rdp = [Int](repeating: 0, count: n)

var ret = 0
for i in arr.indices {
  var left = 0
  for j in 0..<i {
    if arr[j] < arr[i] { left = max(left, ldp[j]) }
  }
  ldp[i] = left + 1
}
for i in arr.indices.reversed() {
  var right = 0
  for j in (i+1..<n).reversed() {
    if arr[i] > arr[j] { right = max(right, rdp[j]) }
  }
  rdp[i] = right + 1
  ret = max(ret, ldp[i] + rdp[i] - 1)
}
print(ret)
