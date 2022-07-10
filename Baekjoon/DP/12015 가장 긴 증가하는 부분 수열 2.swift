// L[i] = 길이 i인 증가하는 부분수열을 만들 수 있는 마지막 원소 중 가장 작은 값
let n = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { Int($0)! }
var lis = [Int.min]

// lis배열에 lis를 구성하는 원소들을 저장한다.
// 하지만 모든 원소들이 lis의 구성요소는 아니다. 중요한 것은 마지막 원소이다.
// lis배열의 마지막 원소보다 현재 원소가 크면, 해당 원소를 lis배열에 추가한다.
// 만약 작다면, 해당 원소의 lowerBound를 찾아서 해당 위치의 원소를 바꾼다.
//  이렇게 되면 lis의 구성요소가 아닐 수 있다. 하지만, 그 후에 나오게 될 더 작은 lis에 대응할 수 있다.
for elem in arr {
  if lis.last! < elem { lis.append(elem) }
  else { lis[lowerBound(lis, elem)] = elem }
}
print(lis.count-1)

func lowerBound(_ arr: [Int], _ target: Int) -> Int {
  var s = 0, e = arr.count
  while s < e {
    let m = (s + e) / 2
    if arr[m] < target { s = m + 1 }
    else { e = m }
  }
  return e
}
