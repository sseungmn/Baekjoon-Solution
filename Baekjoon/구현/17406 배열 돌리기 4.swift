var line = readLine()!.split(separator: " ").map { Int($0)! }
let h = line[0], w = line[1], k = line[2]
var board = [[Int]](repeating: [Int](), count: h)
for i in 0..<h { board[i] = readLine()!.split(separator: " ").map { Int($0)! } }

typealias Coordinate = (x: Int, y: Int)
func rotate(board: inout [[Int]], topLeft: Coordinate, bottomRight: Coordinate) {
  var tmp = board
  for y in topLeft.y...bottomRight.y {
    if y != topLeft.y { tmp[y-1][topLeft.x] = board[y][topLeft.x] } // 상
    if y != bottomRight.y { tmp[y+1][bottomRight.x] = board[y][bottomRight.x] } // 하
  }
  for x in topLeft.x...bottomRight.x {
    if x != bottomRight.x { tmp[topLeft.y][x+1] = board[topLeft.y][x] } // 우
    if x != topLeft.x { tmp[bottomRight.y][x-1] = board[bottomRight.y][x] } // 좌
  }
  board = tmp
}

func calculateBoard(board: [[Int]]) -> Int {
  var ret = 100 * 50
  for y in 0..<h {
    ret = min(ret, board[y].reduce(0, +))
  }
  return ret
}

typealias rcs = (r: Int, c: Int, s: Int)
var operations = [rcs]()
for _ in 0..<k {
  line = readLine()!.split(separator: " ").map { Int($0)! }
  operations.append((r: line[0]-1, c: line[1]-1, s: line[2]))
}

func solution(operations: [rcs]) -> Int {
  var tmp = board
  for operation in operations {
    for phase in 1...(operation.s) {
      rotate(
        board: &tmp,
        topLeft: Coordinate(x: operation.c-phase, y: operation.r-phase),
        bottomRight: Coordinate(x: operation.c+phase, y: operation.r+phase)
      )
    }
  }
  return calculateBoard(board: tmp)
}

// 모든 Permutation을 구한다.
// 각각의 순열마다 solution의 값을 구한다.
// 그 중의 최솟값을 구한다.

var ret = 100 * 50
func permutation(_ arr: [rcs], _ n: Int) {
  if n == 0 { ret = min(ret, solution(operations: arr)) }
  else {
    var a = arr
    permutation(a, n - 1)
    for i in 0..<n {
      a.swapAt(i, n)
      permutation(a, n - 1)
      a.swapAt(i, n)
    }
  }
}
permutation(operations, operations.count - 1)
print(ret)
