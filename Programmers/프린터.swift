import Foundation

struct Queue<T> {
    private var enqueue: [T]
    private var dequeue: [T] = []

    init(_ enqueue: [T] = []) { self.enqueue = enqueue }

    var isEmpty: Bool { enqueue.isEmpty && dequeue.isEmpty }
    var front: T? {
        if dequeue.isEmpty { return enqueue.last }
        return dequeue.last
    }
    mutating func push(_ elem: T) { enqueue.append(elem) }
    mutating func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
  var arr = Array(zip(Array(repeating: false , count: priorities.count), priorities))
  arr[location].0 = true
  var queue = Queue(arr)
  var priorityStack = priorities.sorted()
  var count = 1
  while !queue.isEmpty && count <= priorities.count {
    guard let cur = queue.pop() else { break }
    if cur.1 == priorityStack.last! { // 가장 큰 우선순위일때
      if cur.0 { return count } // 찾고자 하는 위치라면 현재까지의 순번을 방출한다.
      priorityStack.removeLast() // 우선순위 큐에서 제거
      count += 1 // 순번 하나 증가
    } else { // 우선순위에서 밀렸을 때, 뒤로간다.
      queue.push(cur)
    }
  }
  return count
}
