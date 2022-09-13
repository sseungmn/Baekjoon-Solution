struct Queue {
  private var enqueue: [Int] = []
  private var dequeue: [Int] = []
  
  var isEmpty: Bool { enqueue.isEmpty && dequeue.isEmpty }
  
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

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var edges = [[Int]](repeating: [Int](), count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  edges[input[0]].append(input[1])
  edges[input[1]].append(input[0])
}

func bfs(root: Int) {
  var queue = Queue()
  queue.push(root)
  visited[root] = true
  
  while !queue.isEmpty {
    guard let cur = queue.pop() else { return }
    for next in edges[cur] {
      if !visited[next] {
        queue.push(next)
        visited[next] = true
      }
    }
  }
}
bfs(root: 1)
print(visited.filter({ $0 == true }).count - 1)
