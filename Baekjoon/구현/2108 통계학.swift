import Foundation

let mod = Double(100000)
var count = [Int](repeating: 0, count: 8001) // 모든 값에 4000을 더함.
var arr = [Double]()

var sum = Double(0)
for _ in 0..<Int(readLine()!)! {
  let n = Double(readLine()!)!
  arr.append(n)
  sum += n / mod
  count[Int(n + 4000)] += 1
}

// 산술평균
var mean = Int((round((sum / Double(arr.count)) * mod) * 10) / 10)
print(mean)

// 중앙값
arr = arr.sorted()
let medium = Int(arr[arr.count / 2])
print(medium)

// 최빈값
var modeValue = 0
var modeArr = [Int]()
for i in -4000...4000 {
  let num = i + 4000
  if modeValue < count[num] { modeValue = count[num]; modeArr = [num-4000] }
  else if modeValue == count[num] { modeArr.append(num-4000) }
}
var mode = 0
if modeArr.count > 1 { mode = modeArr[1] }
else { mode = modeArr[0] }
print(mode)

// 범위
let range = Int(arr.last! - arr.first!)
print(range)
