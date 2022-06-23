func nextPermutation<T: Comparable>(_ arr: [T]) -> [T]? {
  var tmp = arr
  // 뒤에서부터 시작해 오름차순이 끝나는 지점을 targetIndex
  var targetIndex = -1
  for i in (0..<arr.count-1).reversed() {
    if tmp[i] < tmp[i+1] { targetIndex = i; break }
  }
  if targetIndex == -1 { return nil }
  var minIndex = targetIndex + 1
  // targetIndex보다 큰, 가장 작은 index를 찾는다
  for i in (targetIndex+1..<arr.count) {
    if tmp[targetIndex] < tmp[i] && tmp[i] < tmp[minIndex] { minIndex = i }
  }
  // targetIndex와 minIndex의 값을 바꾼다
  tmp.swapAt(targetIndex, minIndex)
  // targetIndex 뒤의 배열을 앞에서 오름차순으로 정렬한다.
  tmp[targetIndex+1..<tmp.count].sort(by: <)
  return tmp
}


let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
print((nextPermutation(arr) ?? [-1]).map { String($0) }.joined(separator: " "))
