let t = Int(readLine()!)!
typealias Point = (x: Int, y: Int)
let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

func solution() -> Int {
  var input = readLine()!.split(separator: " ").map({ Int($0)! })
  let (w, h, k) = (input[0], input[1], input[2])
  
  // 분리된 영역의 개수를 구하는 문제
  var arr = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
  for _ in 0..<k {
    input = readLine()!.split(separator: " ").map({ Int($0)! })
    arr[input[1]][input[0]] = 1
  }
  
  func dfs(root: Point) {
    arr[root.y][root.x] = 0
    for i in 0..<4 {
      let nx = root.x + dx[i]
      let ny = root.y + dy[i]
      guard 0 <= nx && nx < w,
            0 <= ny && ny < h,
            arr[ny][nx] == 1
      else { continue }
      dfs(root: Point(nx, ny))
    }
  }
  
  var count = 0
  for y in 0..<h {
    for x in 0..<w {
      guard arr[y][x] == 1 else { continue }
      count += 1
      dfs(root: Point(x, y))
    }
  }
  return count
}

for _ in 0..<t { print(solution()) }
