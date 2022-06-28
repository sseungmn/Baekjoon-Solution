import Foundation

// 하, 우, 상, 좌
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

// [r1, c1, r2, c2]
func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var board = [[Int]](repeating: [Int](repeating: 0, count: columns), count: rows)
    for i in 0..<rows*columns { board[i/columns][i%columns] = i+1 }

    var ret = [Int]()
    for query in queries {
        var x = query[1] - 1, y = query[0] - 1
        var tmp = board[y][x]
        var k = 0
        var minValue = tmp
        while k < 4 {
            let nx = x + dx[k], ny = y + dy[k]
            guard query[1] - 1 <= nx && nx <= query[3] - 1,
                query[0] - 1 <= ny && ny <= query[2] - 1 else {
                      k += 1
                      continue
                  }
            board[y][x] = board[ny][nx]
            minValue = min(minValue, board[ny][nx])
            x = nx; y = ny
        }
        board[query[0] - 1][query[1] - 1 + 1] = tmp
        ret.append(minValue)
    }
    return ret
}
