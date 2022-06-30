// R : 배열 뒤집기
// D : 첫번째 수를 버림 - 배열이 비어있는데 사용하면 에러

for _ in 0..<Int(readLine()!)! {
  solution()
}

func solution() {
  let query = readLine()!
  let _ = Int(readLine()!)!
  let line = Array(readLine()!)
  let arr = line[1..<line.count-1].split(separator: ",").map { String($0) }
  var begin = 0, end = arr.count - 1
  var isReversed = false
  for op in query {
    if op == "R" {
      isReversed.toggle()
    } else if op == "D" {
      if begin > end { print("error"); return }
      if isReversed { end -= 1 } else { begin += 1 }
    }
  }
  if begin > end { print("[]"); return }

  if isReversed { print("[\(Array(arr[begin...end]).reversed().joined(separator: ","))]") }
  else { print("[\(Array(arr[begin...end]).joined(separator: ","))]") }
}
