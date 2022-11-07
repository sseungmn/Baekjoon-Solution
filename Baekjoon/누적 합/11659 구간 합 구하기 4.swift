// 11659 구간 합 구하기 4
// 18:54
var line = readLine()!.split(separator: " ").map { Int($0)! }

let (n, m) = (line[0], line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var partialSum = [0]
for i in 1...n {
    partialSum.append(partialSum[i-1] + arr[i-1])
}

(0..<m).forEach { _ in
    line = readLine()!.split(separator: " ").map { Int($0)! }
    let (from, to) = (line[0] - 1, line[1])
    print(partialSum[to] - partialSum[from])
}
