// 5:45
let a = Array(readLine()!)
let b = Array(readLine()!)

var board = [[Int]](repeating: [Int](repeating: 0, count: b.count + 1), count: a.count + 1)

for i in 1...a.count {
  for j in 1...b.count {
    if a[i-1] == b[j-1] { board[i][j] = board[i-1][j-1] + 1 }
    else { board[i][j] = max(board[i-1][j], board[i][j-1])}
  }
}
print(board[a.count][b.count])
