// 1:50:00
let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: n)
for i in 0..<n { arr[i] = Int(readLine()!)! }
arr = arr.sorted()

var tmp = 0
for i in 1..<arr.count {
  tmp = gcd(tmp, arr[i] - arr[i-1])
}
var i = 2
var ret = [Int]()
while i * i <= tmp {
  if tmp % i == 0 {
    ret.append(i)
    if i * i != tmp { ret.append(tmp / i) }
  }
  i += 1
}
print(ret.sorted().reduce("") { "\($0)\($1) " } + "\(tmp)")

func gcd(_ a: Int, _ b: Int) -> Int {
  if a == 0 { return b }
  else if b == 0 { return a }
  return gcd(b, a % b)
}
