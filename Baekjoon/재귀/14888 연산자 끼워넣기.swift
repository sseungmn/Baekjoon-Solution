// 25:40
// 최솟값이 음수가 될 수 있다는 점을 고려하지 못해 시간을 낭비했다.
var arr = [Int]()
var op = [Int]()
var minn = 1_000_000_000
var maxx = -1_000_000_000

let _ = readLine()
arr = readLine()!.split { $0 == " " }.map { Int($0)! }
op = readLine()!.split { $0 == " " }.map { Int($0)! }
recursion(1, arr[0])
print(maxx)
print(minn)

func recursion(_ k: Int, _ val: Int) {
  if k == arr.count {
    minn = min(minn, val)
    maxx = max(maxx, val)
    return
  }
  for i in 0..<4 {
    guard op[i] > 0 else { continue }
    op[i] -= 1
    recursion(k + 1, calc(val, arr[k], i))
    op[i] += 1
  }
}

func calc(_ a: Int, _ b: Int, _ opNum: Int) -> Int {
  if opNum == 0 { return a + b }
  else if opNum == 1 { return a - b }
  else if opNum == 2 { return a * b }
  else { return a / b }
}
