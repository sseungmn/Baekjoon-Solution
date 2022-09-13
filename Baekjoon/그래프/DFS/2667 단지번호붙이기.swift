let n = Int(readLine()!)!
var square = [[Int]]()
for _ in 0..<n {
  let row = readLine()!.map({ Int(String($0))! })
  square.append(row)
}

var town = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]
typealias Point = (x: Int, y: Int)

func dfs(root: Point, index: Int) -> Int {
  var count = 1
  town[root.y][root.x] = index
  
  for k in 0..<4 {
    let nx = root.x + dx[k]
    let ny = root.y + dy[k]
    guard 0 <= nx && nx < n,
          0 <= ny && ny < n,
          square[ny][nx] == 1,
          town[ny][nx] == 0
    else { continue }
    count += dfs(root: Point(nx, ny), index: index)
  }
  return count
}

var index = 1
var ret = [Int]()
for y in 0..<n {
  for x in 0..<n {
    guard square[y][x] == 1,
          town[y][x] == 0 else { continue }
    ret.append(dfs(root: Point(x, y), index: index))
    index += 1
  }
}

print(ret.count)
ret.sorted().forEach { print($0) }
