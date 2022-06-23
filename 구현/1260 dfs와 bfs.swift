// wapas님의 그래프 풀이방식을 많이 참고했습니다.
var line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0], m = line[1], v = line[2]
var bChkList = [Bool](repeating: false, count: n+1)
var dChkList = [Bool](repeating: false, count: n+1)
var board = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
for _ in 0..<m {
  line = readLine()!.split(separator: " ").map { Int($0)! }
  board[line[0]][line[1]] = true
  board[line[1]][line[0]] = true
}

var dret = [Int]()
func dfs(_ cur: Int) {
  dret.append(cur)
  dChkList[cur] = true
  for i in 1...n {
    if !dChkList[i] && board[cur][i] {
      dfs(i)
    }
  }
}
dfs(v)
print(dret.map { String($0) }.joined(separator: " "))

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

var queue = Queue<Int>()
var bret = [Int]()
queue.push(v)
bChkList[v] = true
while !queue.isEmpty {
  guard let cur = queue.pop() else { break }
  bret.append(cur)
  for i in 1...n {
    if !bChkList[i] && board[cur][i] {
      bChkList[i] = true
      queue.push(i)
    }
  }
}
print(bret.map { String($0) }.joined(separator: " "))
