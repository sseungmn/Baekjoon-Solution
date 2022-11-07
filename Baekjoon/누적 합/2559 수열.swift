// 2559 수열
// 21:35
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0], line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

// 1. 구간 합을 이용
// 구간 합을 구한다.
var partialSum = [0]
arr.forEach { num in
    let last = partialSum.last!
    partialSum.append(last + num)
}
// 구간 합을 돌면서 연속 길이만큼 합을 구해, 최대와 비교한다.
var ret = partialSum[k] - partialSum[0]
for i in 0...n-k {
    ret = max(ret, partialSum[i+k] - partialSum[i])
}
print(ret)

// 2. 슬라이딩 윈도우 이용
// 배열을 돌면서 합에 앞 번호는 빼고, 뒷 번호는 추가해, 최대와 비교한다.
var window = arr.prefix(k).reduce(0, +)
var ret = window
for i in k..<n {
    window += arr[i] - arr[i - k]
    ret = max(ret, window)
}
print(ret)
