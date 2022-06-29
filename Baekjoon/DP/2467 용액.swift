// 1 ~ 10^10 : 산성
// -10^10 ~ -1 : 알칼리성
// 혼합액의 특성값 = 두 특성값의 합

// XXXXX 조합 -> 0에 가까운지 비교
// XXXXX 정렬 -> 맨 왼쪽부터 하나씩 -> 다음 용액과 합함. -> 혼합 특성값이 점점 작아지다가, 커지면, 그 직전 값이 해당 값으로 만들 수 있는 최대.
// 음수, 양수로 구간을 나눔 -> 음수에서만 탐색하는데, 음수값 + (양수의 lowerbound, lowerbound - 1, 음수의 최댓값)을 최솟값과 비교한다. -> 마지막으로 양수값이 2개 이상이면, 가장 작은 두 양수를 더한 값도 최솟값과 비교한다.
//---------------------------------------------------------------------------
// 투 포인터를 이용한다.
// 왼쪽 오른쪽포인터에서 하나씩 이전의 값을 각각 비교
// 예) arr[left + 1] + arr[right], arr[left] + arr[right - 1]
// 왼쪽합이 작으면 left + 1, 오른쪽 합이 작으면, right - 1
func lowerBound(_ arr: [Int], _ target: Int) -> Int {
  var left = 0, right = arr.count
  while left < right {
    let mid = (left + right) / 2
    if target <= arr[mid] { right = mid }
    else { left = mid + 1 }
  }
  return right
}

let max = 1000000000
let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var arr = [[Int](), [Int]()]
let zero = lowerBound(input, 0)
arr[0] = Array(input[0..<zero])
arr[1] = Array(input[zero..<input.count])

var minValue = 2 * max
var ret = [Int]()
for num in arr[0] {
  let lb = lowerBound(arr[1], -num)
  if lb > 0 { if abs(num + arr[1][lb - 1]) < minValue { minValue = abs(num + arr[1][lb - 1]); ret = [num, arr[1][lb - 1]] } }
  if lb != arr[1].count { if abs(num + arr[1][lb]) < minValue { minValue = abs(num + arr[1][lb]); ret = [num, arr[1][lb]] } }
  if num != arr[0].last! && abs(num + arr[0].last!) < minValue { minValue = abs(num + arr[0].last!); ret = [num, arr[0].last!] }
}
if arr[1].count > 1 {
  if arr[1][0] + arr[1][1] < minValue { ret = [arr[1][0], arr[1][1]] }
}
print(ret.map { String($0) }.joined(separator: " "))
