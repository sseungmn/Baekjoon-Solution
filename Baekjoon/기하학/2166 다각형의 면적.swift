import Foundation

let n = Int(readLine()!)!
var arr = [[Int]]()

for _ in 0..<n {
  arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var area: Double = 0
area += Double(arr[n-1][0] * arr[0][1])
for i in 0..<n-1 {
    area += Double(arr[i][0] * arr[i+1][1] - arr[i][1] * arr[i+1][0])
}
area -= Double(arr[n-1][1] * arr[0][0])
print(String(format: "%.1lf", abs(area / 2)))
