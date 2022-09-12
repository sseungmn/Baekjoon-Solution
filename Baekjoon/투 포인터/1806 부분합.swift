let line = readLine()!.split(separator: " ").map({ Int($0)! })
let (n, m) = (line[0], line[1])
let arr = readLine()!.split(separator: " ").map({ Int($0)! })

let MAX = 100_000
var p1 = 0, p2 = 0
var sum = arr[0]
var ret = MAX

while true {
  if sum < m {
    if p2 == n-1 { break }
    p2 += 1
    sum += arr[p2]
  } else {
    if p1 <= p2 { ret = min(ret, p2 - p1 + 1) }
    if p1 == n-1 { break }
    sum -= arr[p1]
    p1 += 1
  }
}
print(ret == MAX ? 0 : ret)
