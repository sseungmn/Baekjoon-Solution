struct Queue<T> {
  private var enqueue = [T]()
  private var dequeue = [T]()
  
  var isEmpty: Bool { enqueue.isEmpty && dequeue.isEmpty }
  
  mutating func push(_ elem: T) {
    enqueue.append(elem)
  }
  
  mutating func pop() -> T? {
    if dequeue.isEmpty {
      dequeue = enqueue.reversed()
      enqueue.removeAll()
    }
    return dequeue.popLast()
  }
}

typealias Point = (x: Int, y: Int)
let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (h, w) = (input[0], input[1])
var arr = [[Int]]()
for _ in 0..<h {
  let row = readLine()!.map { Int(String($0))! }
  arr.append(row)
}
var check = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)

var queue = Queue<Point>()
queue.push(Point(0, 0))
check[0][0] = 1

while !queue.isEmpty {
  guard let cur = queue.pop() else { break }
  if cur == (w-1, h-1) { break }
  for k in 0..<4 {
    let nx = cur.x + dx[k]
    let ny = cur.y + dy[k]
    guard 0 <= nx && nx < w,
          0 <= ny && ny < h,
          arr[ny][nx] == 1,
          check[ny][nx] == 0
    else { continue }
    queue.push(Point(nx, ny))
    check[ny][nx] = check[cur.y][cur.x] + 1
  }
}
print(check[h-1][w-1])
