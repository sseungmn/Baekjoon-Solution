// 소수 구하기 - 에라토스테네스의 체
func primes(_ n: Int) -> [Int] {
  var isPrime = [Bool](repeating: true, count: n+1)
  isPrime[0] = false; isPrime[1] = false
  var primes = [Int]()
  
  var i = 2
  while i * i <= n {
    if isPrime[i] {
      var j = i + i
      while j <= n {
        isPrime[j] = false
        j += i
      }
    }
    i += 1
  }
  for i in isPrime.indices {
    if isPrime[i] { primes.append(i) }
  }
  return primes
}

// 연속합 - 투포인터
func solution(_ n: Int, _ primes: [Int]) -> Int {
  if n == 1 { return 0 }
  var p1 = 0, p2 = 0
  var sum = primes[0]
  var count = 0
  
  while true {
    if sum < n {
      if p2 == primes.count - 1 { break }
      p2 += 1
      sum += primes[p2]
    } else if sum >= n {
      if sum == n { count += 1 }
      if p1 == primes.count - 1 { break }
      sum -= primes[p1]
      p1 += 1
    }
  }
  return count
}

let n = Int(readLine()!)!
let ret = solution(n, primes(n))
print(ret)
