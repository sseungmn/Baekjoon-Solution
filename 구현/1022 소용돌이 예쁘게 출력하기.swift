import Foundation

var line = readLine()!.split(separator: " ").map { Int($0)! }
let max = line.map { abs($0) }.max()!
line = line.map { $0 + max } // 모든 좌표값을 양수로 바꾸기

// (r, c)
let topLeft = (line[0], line[1]), bottomRight = (line[2], line[3])

let side = 2 * max + 1
var board = [[Int]](repeating: [Int](repeating: 0, count: bottomRight.1 - topLeft.1 + 1), count: bottomRight.0 - topLeft.0 + 1)

func draw() {
  // 우, 상, 좌, 하
  let dx = [1, 0, -1, 0]
  let dy = [0, -1, 0, 1]
  
  var k = 0
  var x = max, y = max
  var gap = 1, count = 0
  var i = 1
  // 1칸 오른쪽, 1칸 위, 2칸 왼쪽, 2칸 아래
  // 3칸 오른쪽, 3칸 위, 4칸 왼쪽, 4칸 아래
  // 위와 같은 규칙으로 이동한다.
  while i <= side * side {
    for _ in 0..<2 {
      while i <= side * side, count < gap {
        if topLeft.0 <= y && y <= bottomRight.0,
           topLeft.1 <= x && x <= bottomRight.1 {
          board[y - topLeft.0][x - topLeft.1] = i
        }
        y += dy[k % 4]
        x += dx[k % 4]
        i += 1; count += 1
      }
      count = 0; k += 1
    }
    gap += 1
  }
}

draw()
let maxNumber = board.max(by: { $0.max()! < $1.max()! })!.max()!
let formatNumber = Int(log10(Double(maxNumber))) + 1
print(board.map { $0.map { String(format: "%\(formatNumber)d", $0)}.joined(separator: " ")}.joined(separator: "\n"))
