let n = Int(readLine()!)!
// 0: 못놓음, 1: 놓을 수 있음, 2: 이미놓음
var board = [[Int]](repeating: [Int](), count: n)
var diag1 = [Bool](repeating: false, count: 2*n)
var diag2 = [Bool](repeating: false, count: 2*n)

var blackBishop = [(Int, Int)]()
var whiteBishop = [(Int, Int)]()
var maxBlack = 0
var maxWhite = 0

for r in 0..<n {
  let line = readLine()!.split { $0 == " " }
  for c in 0..<n {
    if Int(line[c]) == 1 {
      if (r + c) % 2 == 0 { whiteBishop.append((r,c)) }
      else { blackBishop.append((r,c)) }

    }
  }
}

func recursion(_ bishop: inout [(Int, Int)], _ maxBishop: inout Int, _ index: Int, _ count: Int) {
  if index == bishop.count { maxBishop = max(maxBishop, count); return }

  recursion(&bishop, &maxBishop, index + 1, count)
  let (r, c) = bishop[index]
  if !diag1[r+c] && !diag2[n+r-c] {
    diag1[r+c] = true; diag2[n+r-c] = true
    recursion(&bishop, &maxBishop, index + 1, count + 1)
    diag1[r+c] = false; diag2[n+r-c] = false
  }
}
recursion(&whiteBishop, &maxBlack, 0, 0)
recursion(&blackBishop, &maxWhite, 0, 0)
print(maxBlack + maxWhite)

// 주요했던 점
// 전체 경우를 백트레킹하면, O(2^(N*N))
// 흑과 백으로 나누어서 백트레킹 하면, O(2^(N/2*N/2))
