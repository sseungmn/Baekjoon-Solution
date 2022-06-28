typealias Coordiante = (x : Int, y: Int)
// 상 하 좌 우
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
// Input
var line = readLine()!.split(separator: " ").map { Int($0)! }
var h = line[0], w = line[1]
var board = [[Int]]()
for _ in 0..<h { board.append(readLine()!.split(separator: " ").map { Int($0)! }) }
let virusQueue = virus(board)

// 벽 세우기
// 벽의 개수가 3개가 되면 bfs로 침투 시뮬레이션
// 침투 후 안전영역의 넓이 계산
struct Queue<T> {
  private var enqueue: [T]
  private var dequeue: [T] = []
  
  init(_ enqueue: [T] = []) {
    self.enqueue = enqueue
  }
  
  var isEmpty: Bool {
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

func virus(_ board: [[Int]]) -> Queue<Coordiante> {
  var queue = Queue<Coordiante>()
  // 시작 지점 queue에 추가
  for y in 0..<h {
    for x in 0..<w {
      if board[y][x] == 2 { queue.push((x, y)) }
    }
  }
  return queue
}

func maxSafeArea(_ board: [[Int]]) -> Int {
  var ret = 0
  // 시작 지점 queue에 추가
  for y in 0..<h {
    for x in 0..<w {
      if board[y][x] == 0 { ret += 1 }
    }
  }
  return ret
}

func simulatePenetration(_ board: [[Int]]) -> [[Int]] {
  var queue = virusQueue
  var penetratedBoard = board
  var check = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
  
  while !queue.isEmpty {
    guard let cur = queue.pop() else { break }
    for k in 0..<4 {
      let nx = cur.x + dx[k], ny = cur.y + dy[k]
      guard 0 <= nx && nx < w,
            0 <= ny && ny < h,
            check[ny][nx] == false,
            board[ny][nx] != 1 else { continue }
      queue.push((nx, ny))
      check[ny][nx] = true
      penetratedBoard[ny][nx] = 2
    }
  }
  return penetratedBoard
}

var ret = 0
func recursion(_ board: [[Int]], _ count: Int, _ index: Int) {
  if count == 3 {
    let penetratedBoard = simulatePenetration(board)
    ret = max(ret, maxSafeArea(penetratedBoard))
    return
  }
  if index == w * h { return }
  recursion(board, count, index + 1)
  var newBoard = board
  let x = index % w, y = index / w
  if newBoard[y][x] == 0 {
    newBoard[y][x] = 1
    recursion(newBoard, count + 1, index + 1)
  }
}

recursion(board, 0, 0)
print(ret)
