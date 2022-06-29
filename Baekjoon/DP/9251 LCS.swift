var board = [[Int]](repeating: [Int](repeating: 0, count: 1001), count: 1001)

var a = [String](), b = [String]()
let _ = readLine()!.forEach { a.append(String($0)) }
let _ = readLine()!.forEach { b.append(String($0)) }

for i in 1...a.count {
  for j in 1...b.count {
    if a[i-1] == b[j-1] { board[i][j] = board[i-1][j-1] + 1 }
    else { board[i][j] = max(board[i-1][j], board[i][j-1]) }
  }
}

print(board[a.count][b.count])
