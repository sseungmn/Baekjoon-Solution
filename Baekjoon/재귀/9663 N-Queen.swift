// 시간초과, 비트마스킹을 이용하면 해결가능.
// 하지만 backtracking을 구현했다는 것에 의의를 둔다.
let n = Int(readLine()!)!

var board = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

var ret = 0
func place(_ index: Int, _ count: Int) {
  if count == n { ret += 1; return }
  if index == n*n { return }
  let row = index / n, col = index % n
  place(index + 1, count)
  if check(col, row) {
    board[row][col] = true
    place(index + 1, count + 1)
    board[row][col] = false
  }
}
place(0, 0)
print(ret)

func printBoard() {
  print(board.map { $0.map { return $0 ? "O" : "X" }.joined() }.joined(separator: "\n"))
  print()
}

func check(_ x: Int, _ y: Int) -> Bool {
  let d1 = x + y, d2 = x - y
  for i in 0..<n {
    if 0 <= d1 - i && d1 - i < n && board[i][d1-i] { return false }
    if 0 <= d2 + i && d2 + i < n && board[i][d2+i] { return false }
    if board[i][x] { return false }
    if board[y][i] { return false }
  }
  return true
}
