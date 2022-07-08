// 14:54
let n = Int(readLine()!)!
var board = [[Int]](repeating: [Int](), count: n)
for i in 0..<n { board[i] = readLine()!.split { $0 == " " }.map { Int($0)! } }

var minGap = 100 * 10

func recursion(_ teamA: [Int], _ teamB: [Int], _ index: Int) {
  if index == n { minGap = min(minGap, calcScore(teamA, teamB)); return }
  var a = teamA, b = teamB
  a.append(index); b.append(index)
  if teamA.count < n / 2 { recursion(a, teamB, index + 1) }
  if teamB.count < n / 2 { recursion(teamA, b, index + 1) }
}

func calcScore(_ teamA: [Int], _ teamB: [Int]) -> Int {
  var scoreA = 0, scoreB = 0
  for a1 in teamA {
    for a2 in teamA {
      scoreA += board[a1][a2]
    }
  }
  for b1 in teamB {
    for b2 in teamB {
      scoreB += board[b1][b2]
    }
  }
  return abs(scoreA - scoreB)
}

recursion([], [], 0)
print(minGap)
