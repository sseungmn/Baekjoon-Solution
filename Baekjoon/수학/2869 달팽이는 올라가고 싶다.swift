import Foundation

let line = readLine()!.split { $0 == " " }.map { Int($0)! }
let a = line[0], b = line[1], v = line[2]
// v - a <= (a - b) * n 을 만족하는 n이 존재할 때, n+1일날 막대를 모두 올라간다.
print(Int(ceil(Double(v - a) / Double(a - b)) + 1))
