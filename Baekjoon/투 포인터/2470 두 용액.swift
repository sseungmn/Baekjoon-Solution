let MAX = -1_000_000_000

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map({ Int($0)! }).sorted()

var p1 = 0, p2 = n - 1
var closest = (MAX, MAX)

while p1 < p2 {
  if abs(arr[p1] + arr[p2]) < abs(closest.0 + closest.1) {
    closest = (arr[p1], arr[p2])
  }
  
  if abs(arr[p1 + 1] + arr[p2]) < abs(arr[p1] + arr[p2 - 1]) {
    p1 += 1
  } else {
    p2 -= 1
  }
}
print(closest.0, closest.1)
