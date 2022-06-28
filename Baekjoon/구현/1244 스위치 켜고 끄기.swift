let n = Int(readLine()!)!
var state = readLine()!.split(separator: " ").map { Int($0)! }

func male(_ arr: inout [Int], _ num: Int) {
  var index = num
  while true {
    guard index - 1 < arr.count else { break }
    arr[index - 1] = 1 - arr[index - 1]
    index += num
  }
}
func female(_ arr: inout [Int], _ num: Int) {
  for i in 1...num {
    let left = num - i - 1, right = num + i - 1
    guard 0 <= left && right < arr.count else { break }
    if arr[left] != arr[right] { break }
    arr[left] = 1 - arr[left]
    arr[right] = 1 - arr[right]
  }
  arr[num - 1] = 1 - arr[num - 1]
}

for _ in 0..<Int(readLine()!)! {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  line[0] == 1 ? male(&state, line[1]) : female(&state, line[1])
}
var ret = ""
for i in 0..<state.count {
  if i != 0 {
    if i % 20 == 0 { ret += "\n" }
    else { ret += " " }
  }
  ret += String(state[i])
}
print(ret)
