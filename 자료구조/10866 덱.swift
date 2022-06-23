import Foundation

final class FileIO {
  private let buffer:[UInt8]
  private var index: Int = 0

  init(fileHandle: FileHandle = FileHandle.standardInput) {

    buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
  }

  @inline(__always) private func read() -> UInt8 {
    defer { index += 1 }

    return buffer[index]
  }

  @inline(__always) func readInt() -> Int {
    var sum = 0
    var now = read()
    var isPositive = true

    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
      sum = sum * 10 + Int(now-48)
      now = read()
    }

    return sum * (isPositive ? 1:-1)
  }

  @inline(__always) func readString() -> String {
    var now = read()

    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
    let beginIndex = index-1

    while now != 10,
          now != 32,
          now != 0 { now = read() }

    return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
  }

  @inline(__always) func readAscii() -> Int {
    var str = 0
    var now = read()

    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

    while now != 10, now != 32, now != 0 {
      str += Int(now)
      now = read()
    }
    return str
  }

  @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
    var now = read()

    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
    let beginIndex = index-1

    while now != 10,
          now != 32,
          now != 0 { now = read() }

    return Array(buffer[beginIndex..<(index-1)])
  }
}

struct Deque {
  private var left = [Int]()
  private var right = [Int]()

  mutating func pushFront(_ num: Int) {
    left.append(num)
  }
  mutating func popFront() -> Int? {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    return left.popLast()
  }

  mutating func pushBack(_ num: Int) {
    right.append(num)
  }
  mutating func popBack() -> Int? {
    right.removeFirst()
    if right.isEmpty {
      right = left.reversed()
      left.removeAll()
    }
    return right.popLast()
  }

  var size: Int {
    return left.count + right.count
  }

  var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }

  var front: Int? {
    if left.isEmpty {
      return right.first
    }
    return left.last
  }

  var back: Int? {
    if right.isEmpty {
      return left.first
    }
    return right.last
  }
}

let fileIO = FileIO()
var deque = Deque()

for _ in 0..<fileIO.readInt() {
  switch fileIO.readString() {
  case "push_front": deque.pushFront(fileIO.readInt())
  case "push_back": deque.pushBack(fileIO.readInt())
  case "pop_front": print(deque.popFront() ?? -1)
  case "pop_back": print(deque.popBack() ?? -1)
  case "size": print(deque.size)
  case "empty": print(deque.isEmpty ? 1 : 0)
  case "front": print(deque.front ?? -1)
  case "back": print(deque.back ?? -1)
  default: fatalError()
  }
}
