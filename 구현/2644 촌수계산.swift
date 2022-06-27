struct Queue<T> {
  private var enqueue: [T]
  private var dequeue: [T] = []

  init(_ enqueue: [T] = []) {
    self.enqueue = enqueue
  }

  var isEmtpy: Bool {
    return enqueue.isEmpty && dequeue.isEmpty
  }

  mutating func push(_ elem: T) {
    enqueue.append(elem)
  }

  mutating func pop() -> T? {
    if dequeue.isEmpty {
      dequeue = enqueue.reversed()
      enqueue.removeAll()
    }
    return dequeue.popLast()
  }
}

typealias Relation = (person: Int, count: Int)
// Input
let n = Int(readLine()!)!
var relations = [[Int]](repeating: [Int](), count: n+1)
var check = [Bool](repeating: false, count: n+1)
var line = readLine()!.split(separator: " ").map { Int($0)! }
let x = line[0], y = line[1]
for _ in 0..<Int(readLine()!)! {
  line = readLine()!.split(separator: " ").map { Int($0)! }
  relations[line[0]].append(line[1])
  relations[line[1]].append(line[0])
}

func solution() -> Int? {
  var queue = Queue<Relation>()
  queue.push((x, 0))
  while !queue.isEmtpy {
    guard let cur = queue.pop() else { return nil }
    for next in relations[cur.person] {
      if next == y { return cur.count + 1 }
      guard check[next] == false else { continue }
      queue.push((next, cur.count + 1))
      check[next] = true
    }
  }
  return nil
}

print(solution() ?? -1)
