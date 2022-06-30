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
  var first: T? {
    if dequeue.isEmpty { return enqueue.first }
    else { return dequeue.last }
  }
}
// 보드의 크기 N
// 사과의 개수 K
// K개의 (행, 열) -> 맨 처음 (1행 1열)
// 방향 변환 횟수 L
// (X초, 방향) X초 뒤에 방향을 전환한다.

// 0 : 빈 칸, 1 : 사과, 2 : 몸통
let n = Int(readLine()!)!
let k = Int(readLine()!)!

var board = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)

// (row, column)
typealias Coordinate = (x: Int, y: Int)
var apple = [Coordinate]()
for _ in 0..<k {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  board[line[0]][line[1]] = 1
}

// (time, direction) -> L(왼쪽으로), D(오른쪽으로)
typealias Rotation = (time: Int, direction: String)
let l = Int(readLine()!)!
var hrot = [Rotation]()
var trot = Queue<Rotation>()
for _ in 0..<l {
  let line = readLine()!.split(separator: " ")
  hrot.append((Int(line[0])!, String(line[1])))
}
// 시간 순서대로 정렬
hrot = hrot.sorted { $0.time > $1.time }

// 동, 남, 서, 북 (시계방향)
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

// 매 초마다 이동, while문 한번 반복이 1초를 의미
func move() -> Int {
  var ht = 0, tt = 0 // 시간
  var hdir = 0, tdir = 0 // 방향
  var head: Coordinate = (1, 1)
  var tail: Coordinate = (1, 1)
  board[1][1] = 2
  // 머리 이동
  // 머리의 충돌 검사
  // 꼬리 이동
  // 머리 회전
  // 꼬리 회전
  while true {
    // 시간이 지남
    ht += 1
    // 머리의 다음 좌표
    let nhx = head.x + dx[hdir], nhy = head.y + dy[hdir]
    // 충돌 검사
    guard 0 < nhx && nhx <= n,
          0 < nhy && nhy <= n,
          board[nhy][nhx] != 2 else { return ht }
    // 꼬리의 다음 좌표
    let ntx = tail.x + dx[tdir], nty = tail.y + dy[tdir]
    if board[nhy][nhx] != 1 {
      // 사과가 없다면, 이전의 꼬리가 위치한 칸을 비워준다.
      board[tail.y][tail.x] = 0
      tail = (ntx, nty)
      tt += 1
    }
    // 머리 회전
    if ht == hrot.last?.time {
      let curRotation = hrot.popLast()!
      if curRotation.direction == "L" { hdir = (hdir+3)%4 }
      else { hdir = (hdir+1)%4 }
      trot.push(curRotation)
    }
    if tt == trot.first?.time {
      let curRotation = trot.pop()!
      if curRotation.direction == "L" { tdir = (tdir+3)%4 }
      else { tdir = (tdir+1)%4 }
    }
    head = (nhx, nhy)
    board[nhy][nhx] = 2
  }
}

print(move())
