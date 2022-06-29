var board = [[[Int]]](
  repeating: [[Int]](
    repeating: [Int](
      repeating: 0,
      count: 101),
    count: 101),
  count: 101)

var a = [String](), b = [String](), c = [String]()
let _ = readLine()!.forEach { a.append(String($0)) }
let _ = readLine()!.forEach { b.append(String($0)) }
let _ = readLine()!.forEach { c.append(String($0)) }

func solution() {
  for x in 1...a.count {
    for y in 1...b.count {
      for z in 1...c.count {
        if a[x-1] == b[y-1] && b[y-1] == c[z-1]  { board[x][y][z] = board[x-1][y-1][z-1] + 1 }
        else { board[x][y][z] = max(board[x-1][y][z], board[x][y-1][z], board[x][y][z-1]) }
      }
    }
  }
  let lcsLen = board[a.count][b.count][c.count]
  print(lcsLen)
}
solution()
