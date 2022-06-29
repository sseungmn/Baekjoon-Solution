let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
// 치킨거리 = 집 ~ 가장 가까운 치킨집 사이의 거리
// 도시의 치킨거리 = 모든 집의 "치킨 거리"의 합
// 거리 = 맨해튼 거리
// 0 빈칸    1 집    2 치킨집
// 좌표는 (1, 1)에서부터 시작

// 치킨집을 모두 배열에 담아놓는다.
// 백트래킹으로 하나씩 제거하면서 치킨거리를 구한다.
// 깊이 M을 베이스로 한다.
// --------------------------------------
// 집 <-> 치킨집 사이의 모든 거리들을 계산해 저장해놓으면
// 거리를 여러번 계산하는 낭비를 줄일 수 있다.

typealias Coordinate = (x: Int, y: Int)
var line = readLine()!.split(separator: " ").map { Int($0)! }
let n = line[0], m = line[1]

var stores = [Coordinate](), houses = [Coordinate]()
stores.reserveCapacity(13); houses.reserveCapacity(100)

for y in 0..<n {
  line = readLine()!.split(separator: " ").map { Int($0)! }
  for x in 0..<n {
    if line[x] == 2 { stores.append((x, y)) }
    else if line[x] == 1 { houses.append((x, y)) }
  }
}

func recursion(_ picked: [Coordinate], _ index: Int) {
  if picked.count == m {
    ret = min(ret, dist(picked))
    return
  }
  if index == stores.count {
    if picked.count > 0 { ret = min(ret, dist(picked)) }
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
  return cityDist
}

var ret = 10000
recursion([], 0)
print(ret)
