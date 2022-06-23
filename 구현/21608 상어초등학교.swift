import Foundation

enum Direction: CaseIterable {
  case up, down, left, right

  var dx: Int {
    switch self {
    case .up: return 0
    case .down: return 0
    case .left: return -1
    case .right: return 1
    }
  }

  var dy: Int {
    switch self {
    case .up: return -1
    case .down: return 1
    case .left: return 0
    case .right: return 0
    }
  }
}

func totalScore(_ n: Int, _ favorite: [Int: [Int]], _ arr: [[Int]]) -> Int {
  var totalScore = 0
  for y in 0..<n {
    for x in 0..<n {
      let cur = arr[y][x]
      let arounds = Direction.allCases
        .map { dir in
          let nx = x + dir.dx, ny = y + dir.dy
          guard 0 <= nx && nx < n, 0 <= ny && ny < n else { return 0 }
          return arr[ny][nx]
        }
        .filter { $0 != 0 }
      totalScore += score(favorite[cur]!, arounds)
    }
  }
  return totalScore
}

func score(_ arr1: [Int], _ arr2: [Int]) -> Int {
  let union = Set(arr1 + arr2)
  let intersectionCount = arr1.count + arr2.count - union.count
  if intersectionCount == 0 { return 0 }
  return Int(pow(10.0, Double(intersectionCount - 1)))
}

func printArray(_ arr: [[Int]]) {
  let n = arr.count
  for y in 0..<n {
    for x in 0..<n {
      print(arr[y][x], terminator: " ")
    }
    print()
  }
}

func aroundFavoriteCount(_ arr: [[Int]], _ favorites: [Int], _ curX: Int, _ curY: Int) -> Int {
  let n = arr.count
  return Direction.allCases
    .reduce(0) { partialResult, dir in
      let nx = curX + dir.dx, ny = curY + dir.dy
      guard 0 <= nx && nx < n, 0 <= ny && ny < n else { return partialResult }
      return favorites.contains(arr[ny][nx]) ? partialResult + 1 : partialResult
    }
}

//let fileIO = FileIO()
//let n = fileIO.readInt()
var n = Int(readLine()!)!
var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var students = [Int]()
var favorites = [Int : [Int]]()
var empty = [[Int]](repeating: [Int](repeating: 4, count: n), count: n)
for y in 0..<n {
  for x in 0..<n {
    if 0 == y || y == n - 1 { empty[y][x] -= 1 }
    if 0 == x || x == n - 1 { empty[y][x] -= 1 }
  }
}
for _ in 0..<n*n {
  //  let line = fileIO.readString().split(separator: " ").map { Int($0)! }
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  students.append(line[0])
  favorites[line[0]] = Array(line[1..<5])
}

for i in 0..<students.count {
  // 현재 순번의 학생이 어디 앉으면 좋을지 결정해야함.
  let student = students[i]
  let favorite = favorites[student]!
  var maxFavorite = 0
  var longlist0 = [(Int, Int)]()
  for y in 0..<n {
    for x in 0..<n {
      if arr[y][x] != 0 { continue }
      let curFavorite = aroundFavoriteCount(arr, favorite, x, y)
      if maxFavorite <= curFavorite {
        if maxFavorite < curFavorite {
          maxFavorite = curFavorite
          longlist0.removeAll()
        }
        longlist0.append((x, y))
      }
    }
  }
  var maxEmpty = 0
  var longlist1 = [(Int, Int)]()
  for (x, y) in longlist0 {
    if maxEmpty <= empty[y][x] {
      if maxEmpty < empty[y][x] {
        maxEmpty = empty[y][x]
        longlist1.removeAll()
      }
      longlist1.append((x, y))
    }
  }
  let (x, y) = longlist1.first!
  Direction.allCases.forEach { dir in
    let nx = x + dir.dx, ny = y + dir.dy
    guard 0 <= nx && nx < n, 0 <= ny && ny < n else { return }
    empty[ny][nx] -= 1
  }
  arr[y][x] = student
}

print(totalScore(n, favorites, arr))
