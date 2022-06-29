var board = [[Int]](repeating: [Int](repeating: 0, count: 1001), count: 1001)

var a = [String](), b = [String]()
let _ = readLine()!.forEach { a.append(String($0)) }
let _ = readLine()!.forEach { b.append(String($0)) }

func solution() {
  for i in 1...a.count {
    for j in 1...b.count {
      if a[i-1] == b[j-1] { board[i][j] = board[i-1][j-1] + 1 }
      else { board[i][j] = max(board[i-1][j], board[i][j-1]) }
    }
  }
  let lcsLen = board[a.count][b.count]
  print(lcsLen)
  if lcsLen != 0 { printLCS() }
}
  
func printLCS() {
  var lcs = [String]()
  var i = a.count, j = b.count
  while board[i][j] != 0 {
    if board[i-1][j] == board[i][j] { i -= 1 }
    else if board[i][j-1] == board[i][j] { j -= 1 }
    else {
      lcs.append(a[i-1])
      i -= 1; j -= 1
    }
  }
  print(lcs.reversed().joined())
}

solution()
