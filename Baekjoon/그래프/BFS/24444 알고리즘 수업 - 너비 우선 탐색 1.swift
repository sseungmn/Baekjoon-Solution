struct Queue {
  private var enqueue: [Int] = []
  private var dequeue: [Int] = []
  
  var isEmtpy: Bool { enqueue.isEmpty && dequeue.isEmpty }
  
  mutating func push(_ elem: Int) {
    enqueue.append(elem)
  }
  
  mutating func pop() -> Int? {
    if dequeue.isEmpty {
      dequeue = enqueue.reversed()
      enqueue.removeAll()
    }
    return dequeue.popLast()
  }
}

var input = readLine()!.split(separator: " ").map({ Int($0)! })
var (n, m, r) = (input[0], input[1], input[2])
var edges = [[Int]](repeating: [Int](), count: n + 1)
var visited = [Int](repeating: 0, count: n + 1)
for _ in 0..<m {
  input = readLine()!.split(separator: " ").map({ Int($0)! })
  edges[input[0]].append(input[1])
  edges[input[1]].append(input[0])
}
edges = edges.map { $0.sorted() }

func bfs(root: Int) {
  var index = 1
  var queue = Queue()
  visited[root] = index
  index += 1
  queue.push(root)
  
  while !queue.isEmtpy {
    guard let cur = queue.pop() else { return }
    for next in edges[cur] {
      guard visited[next] == 0 else { continue }
      visited[next] = index
      index += 1
      queue.push(next)
    }
  }
}

bfs(root: r)
for i in 1...n { print(visited[i]) }
