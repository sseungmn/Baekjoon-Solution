// 17:40
var board = [[Int]](repeating: [Int](), count: 9)

for i in 0..<9 { board[i] = readLine()!.split { $0 == " " }.map { Int($0)! } }

var finished = false
func backtracking(_ k: Int) {
  if finished { return }
  if k == 81 { printBoard(); finished = true; return }
  let row = k / 9, col = k % 9
  if board[row][col] != 0 { backtracking(k + 1) }
  else {
    for i in 1...9 {
      if verify(row, col, i) {
        board[row][col] = i
        backtracking(k + 1)
        board[row][col] = 0
      }
    }
  }
}

func verify(_ r: Int, _ c: Int, _ num: Int) -> Bool {
  let bc = (c / 3) * 3, br = (r / 3) * 3 // box의 첫번째 좌표
  for i in 0..<9 {
    if board[r][i] == num { return false }
    if board[i][c] == num { return false }
    if board[br+i/3][bc+i%3] == num { return false }
  }
  return true
}

func printBoard() {
  print(board.map { $0.map { String($0) }.joined(separator: " ") }.joined(separator: "\n"))
}

backtracking(0)
