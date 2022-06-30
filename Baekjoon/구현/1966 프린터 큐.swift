// 중요도를 정렬 -> 가장 끝에 있는 중요도가 가장 큰 중요도.
// 배열 순서대로 돌면서, 중요도가 가장 크면 팝, 아니면 다시 집어넣기

struct Queue<T> {
  private var enqueue: [T]
  private var dequeue: [T] = []
  init(_ enqueue: [T] = []) { self.enqueue = enqueue }

  var isEmpty: Bool { enqueue.isEmpty && dequeue.isEmpty }
  mutating func push(_ elem: T) { enqueue.append(elem) }
  mutating func pop() -> T? {
    if dequeue.isEmpty {
      dequeue = enqueue.reversed()
      enqueue.removeAll()
    }
    return dequeue.popLast()
  }
}
for _ in 0..<Int(readLine()!)! {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  let n = line[0], m = line[1]
  var priority = readLine()!.split(separator: " ").map { Int($0)! }
  // (순번, 중요도)
  var queue = Queue(Array(zip(Array(0..<n), priority)))
  priority = priority.sorted()

  var count = 0
loop: while !queue.isEmpty {
    let cur = queue.pop()!
    if cur.1 == priority.last! {
      priority.removeLast(); count += 1
      if cur.0 == m { print(count); break loop } // 원하는 문서가 나오면 순번 출력
    } else { queue.push(cur) }
  }
}
