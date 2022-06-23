struct Queue1 {
  var left = [Int]()
  var right = [Int]()

  init() {}
  init(_ array: [Int]) {
    right = array
  }

  mutating func enqueue(_ num: Int) {
    right.append(num)
  }

  mutating func dequeue() -> Int? {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    return left.popLast()
  }

  var size: Int {
    return left.count + right.count
  }

  var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }
}

func solution(_ n: Int) -> Int {
  var queue = Queue1(Array(1...n))
  while queue.size > 1 {
    if let _ = queue.dequeue(),
       let num = queue.dequeue() {
      queue.enqueue(num)
    }
  }
  return queue.dequeue() ?? 0
}

let num = Int(readLine()!)!
print(solution(num))
