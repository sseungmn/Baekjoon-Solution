// 11:42
let max = 123456 * 2
var isPrime = [Bool](repeating: true, count: max*2+1)
isPrime[0] = false; isPrime[1] = false;
var i = 2
while true {
  if i * i >= 2 * max + 1 { break }
  var j = i * 2
  while j < 2*max+1 {
    isPrime[j] = false
    j += i
  }
  i += 1
}

var ret = ""
while true {
  let num = Int(readLine()!)!
  if num == 0 { break }
  var cnt = 0
  for i in num+1...2*num {
    if isPrime[i] { cnt += 1 }
  }
  ret += "\(cnt)\n"
}
print(ret)

// 구간합을 이용해서 더욱 빨리 해결할 수 있다. - https://www.acmicpc.net/source/36912784
// 1. 에라토스테네스의 체를 이용해 max * 2까지의 소수를 판별한다.
// 2. S(n) = n까지 소수의 개수
// 3. 답 : S(2n) - S(n)
let max = 123456
var isPrime = [Bool](repeating: true, count: max*2+1)
var i = 2
while i * i <= 2 * max {
  var j = i * 2
  while j <= 2 * max {
    isPrime[j] = false
    j += i
  }
  i += 1
}

var psum = [Int](repeating: 0, count: max*2+1)
for i in 2..<max*2+1 { psum[i] = isPrime[i] ? psum[i-1] + 1 : psum[i-1] }

var ret = ""
while true {
  let num = Int(readLine()!)!
  if num == 0 { break }
  ret += "\(psum[2*num]-psum[num])\n"
}
print(ret)
