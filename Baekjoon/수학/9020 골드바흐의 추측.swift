// 8:41
// 1. 에라토스테네스의 채로 10000까지의 소수를 구한다.
// 2. 두 소수의 차이가 가장 작은것부터 순서대로 구하는 것이므로,
// 주어진 수의 반에서부터 내림차순으로 탐색한다.

let max = 10_000
var isPrime = [Bool](repeating: true, count: max+1)
isPrime[0] = false; isPrime[1] = false
var i = 2
while i * i <= max {
  var j = i * 2
  while j <= max {
    isPrime[j] = false
    j += i
  }
  i += 1
}

for _ in 0..<Int(readLine()!)! {
  let num = Int(readLine()!)!
  for i in i/2..<i {
    if isPrime[i] && isPrime[num - i] { print(num - i, i); break }
  }
}
