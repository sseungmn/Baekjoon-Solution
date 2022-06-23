func prevPermutation<T: Comparable>(_ arr: [T]) -> [T]? {
  var tmp = arr
  // 뒤에서부터 시작해 내림차순 끝나는 지점을 targetIndex
  var targetIndex = -1
  for i in (0..<arr.count-1).reversed() {
    if tmp[i] > tmp[i+1] { targetIndex = i; break }
  }
  if targetIndex == -1 { return nil }
  var maxIndex = targetIndex + 1
  // targetIndex보다 작은, 가장 큰 index를 찾는다
  for i in (targetIndex+1..<arr.count) {
    if tmp[targetIndex] > tmp[i] && tmp[i] > tmp[maxIndex] { maxIndex = i }
  }
  // targetIndex와 maxIndex의 값을 바꾼다
  tmp.swapAt(targetIndex, maxIndex)
  // targetIndex 뒤의 배열을 앞에서 내림차순으로 정렬한다.
  tmp[targetIndex+1..<tmp.count].sort(by: >)
  return tmp
}


let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
print((prevPermutation(arr) ?? [-1]).map { String($0) }.joined(separator: " "))
