typealias Coordinate = (x: Int, y: Int)
let dx = [0, 1, 0, -1]
let dy = [-1, 0, 1, 0]

var board = [[Int]](repeating: [Int](repeating: 0, count: 51), count: 51)

var line = readLine()!.split(separator: " ").map { Int($0)! }
let h = line[0], w = line[1]

line = readLine()!.split(separator: " ").map { Int($0)! }
var cur = Coordinate(line[1], line[0])
var dir = line[2]

for r in 0..<h {
  line = readLine()!.split(separator: " ").map { Int($0)! }
  for c in 0..<w { board[r][c] = line[c] }
}

var count = 0
loop: while true {
  // 1. 현재 위치를 청소한다.
  if board[cur.y][cur.x] == 0 { count += 1 }
  board[cur.y][cur.x] = -1
  // 2. 인접한 칸을 탐색
  for _ in 0..<4 {
    // 2a. 왼쪽에 (청소하지 않은, 빈공간)을 확인
    dir = (dir + 3) % 4
    let left: Coordinate = (cur.x + dx[dir], cur.y + dy[dir])
    guard 0 < left.x && left.x < w, 0 < left.y && left.y < h else { continue }
    if board[left.y][left.x] == 0 { cur = left; continue loop }
  }
  // 2b. 바로 뒤쪽이 벽인지 확인
  let backDir = (dir + 2) % 4
  let back: Coordinate = (cur.x + dx[backDir], cur.y + dy[backDir])
  guard 0 < back.x && back.x < w, 0 < back.y && back.y < h else { break loop }
  if board[back.y][back.x] == 1 { break loop }
  else { cur = back }
}

print(count)
