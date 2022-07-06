// 4:30
// 수가 10,000,000이하라서, index로 활용하기엔 무리가 있다.
// Dictionary를 이용해서, 한 번 나올 때마다, 1씩 추가한다
let n = Int(readLine()!)!
var dict = [Int: Int]()
readLine()!.split { $0 == " " }.forEach {
  let num = Int($0)!
  if dict[num] == nil { dict[num] = 1 }
  else { dict[num]! += 1 }
}
let m = Int(readLine()!)!
var ret = ""
readLine()!.split { $0 == " " }.forEach {
  let num = Int($0)!
  ret += dict[num] == nil ? "0 " : "\(dict[num]!) "
}
print(ret)

// 18:00
// 입력으로 주어진 배열을 sort 한 뒤
// upperBound - lowerBound로 개수를 구한다.
let n = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
let _ = readLine()
var ret = ""
readLine()!.split { $0 == " " }.forEach {
  let num = Int($0)!
  ret += "\(upperBound(arr, num) - lowerBound(arr, num)) "
}
print(ret)

func upperBound<T: Comparable>(_ arr: [T], _ target: T) -> Int {
  var begin = 0, end = arr.count
  while begin < end {
    let mid = (begin + end) / 2
    if arr[mid] <= target { begin = mid + 1 }
    else { end = mid }
  }
  return end
}

func lowerBound<T: Comparable>(_ arr: [T], _ target: T) -> Int {
  var begin = 0, end = arr.count
  while begin < end {
    let mid = (begin + end) / 2
    if arr[mid] < target { begin = mid + 1 }
    else { end = mid }
  }
  return end
}
// 이론상 이게 빠르진 않다
