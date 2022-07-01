// 1:10:56
struct Queue<T> {
  private var enqueue: [T]
  private var dequeue: [T] = []

  init(_ queue: [T] = []) {
    enqueue = queue
  }

  var isEmpty: Bool {
    return enqueue.isEmpty && dequeue.isEmpty
  }

  mutating func pop() -> T? {
    if dequeue.isEmpty {
      dequeue = enqueue.reversed()
      enqueue.removeAll()
    }
    return dequeue.popLast()
  }

  mutating func push(_ elem: T) {
    enqueue.append(elem)
  }
}

var gear = [[String]](repeating: [String](), count: 4)
var top = [0, 0, 0, 0]
for i in 0..<4 { gear[i] = Array(readLine()!.map { String($0) }) }

for _ in 0..<Int(readLine()!)! {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  let start = line[0]-1, dir = line[1]

  // -2 : 미정, -1: 반시계, 0: 가만히, 1: 시계
  var spin = [-2, -2, -2, -2]
  var queue = Queue([start])
  spin[start] = dir
  // 회전 방향 설정
  while !queue.isEmpty {
    let cur = queue.pop()!
    // 오른쪽 기어
    let right = cur + 1, left = cur - 1
    if right < 4 && spin[right] == -2 {
      queue.push(right)
      if spin[cur] == 0 { spin[right] = 0 }
      else {
        // 현재의 3시방향 != 다음꺼의 9시방향 ? 역방향 회전 : 가만히
        if gear[cur][(top[cur] + 2) % 8] != gear[right][(top[right] + 6) % 8] { spin[right] = -spin[cur] }
        else { spin[right ] = 0 }
      }
    }
    // 왼쪽 기어
    if 0 <= left && spin[left] == -2 {
      queue.push(left)
      if spin[cur] == 0 { spin[left] = 0 }
      else {
        // 다음꺼의 3시방향 != 현재의 9시 방향 ? 역방향 회전 : 가만히
        if gear[left][(top[left] + 2) % 8] != gear[cur][(top[cur] + 6) % 8] { spin[left] = -spin[cur] }
        else { spin[left] = 0 }
      }
    }
  }
  // 회전
  for i in 0..<4 {
    if spin[i] == 0 { continue }
    top[i] = spin[i] == 1 ? (top[i] + 7) % 8 : (top[i] + 1) % 8
  }
}

// 계산
var ret = 0
var exp = 1
for i in 0..<4 {
  if gear[i][top[i]] == "1" { ret += exp }
  exp *= 2
}
print(ret)
