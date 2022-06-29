let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

struct Queue<T> {
  private var enqueue: [T]
  private var dequeue: [T] = []

  init(_ enqueue: [T] = []) { self.enqueue = enqueue.reversed() }

  var isEmpty: Bool { enqueue.isEmpty && dequeue.isEmpty }

  mutating func push(_ elem: T) { enqueue.append(elem) }
  mutating func pop() -> T? {
    if dequeue.isEmpty {
      dequeue = enqueue.reversed()
      enqueue.removeAll()
    }
    return dequeue.popLast()
  }
}
// 치킨거리 = 집 ~ 가장 가까운 치킨집 사이의 거리
// 도시의 치킨거리 = 모든 집의 "치킨 거리"의 합
// 거리 = 맨해튼 거리
// 0 빈칸    1 집    2 치킨집
// 좌표는 (1, 1)에서부터 시작

// 치킨집을 모두 배열에 담아놓는다.
// 백트래킹으로 하나씩 제거하면서 치킨거리를 구한다.
// 깊이 M을 베이스로 한다.

typealias Coordinate = (x: Int, y: Int)
var line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0], m = line[1]

var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var stores = [Coordinate](), houses = [Coordinate]()
stores.reserveCapacity(13); houses.reserveCapacity(100)

for y in 0..<n {
  line = readLine()!.split(separator: " ").map { Int($0)! }
  for x in 0..<n {
    board[y][x] = line[x]
    if line[x] == 2 { stores.append((x, y)); board[y][x] = 0 }
    else if line[x] == 1 { houses.append((x, y)) }
  }
}

func recursion(_ picked: [Coordinate], _ index: Int) {
  if picked.count == m || index == stores.count {
    let cityDist = dist(picked)
    ret = cityDist == 0 ? ret : min(ret, dist(picked))
    return
  }

  var tmp = picked
  recursion(tmp, index + 1)
  tmp.append(stores[index])
  recursion(tmp, index + 1)
}


func dist(_ pickedStore: [Coordinate]) -> Int {
  var cityDist = 0
  for house in houses {
    var chickenDist = 100
    for store in pickedStore {
      chickenDist = min(chickenDist, abs(store.y - house.y) + abs(store.x - house.x))
    }
    cityDist += chickenDist
  }
  print("=============================")
  print("cityDist(\(cityDist)) -> pickedStore : \(pickedStore)")
  return cityDist
}

var ret = 10000
recursion([], 0)
print(ret)
