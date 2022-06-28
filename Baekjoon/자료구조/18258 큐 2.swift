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

struct Queue {
  private var left = Array<Int>()
  private var right = Array<Int>()

  mutating func enqueue(_ elem: Int) {
    right.append(elem)
  }

  mutating func dequeue() -> Int? {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    return left.popLast()
  }

  var size: Int {
    return left.count + right.count
  }

  var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }

  var front: Int? {
    return left.isEmpty ? right.first : left.last
  }

  var back: Int? {
    return right.isEmpty ? left.first : right.last
  }
}

func solution() {
  let file = FileIO()
  var q = Queue()
  var res = ""

  for _ in 0 ..< file.readInt() {
    let cmd = file.readAscii()
    switch cmd {
    case 335: // pop
      res += "\(q.dequeue() ?? -1)\n"
    case 443: // size
      res += "\(q.size)\n"
    case 559: // empty
      res += "\(q.isEmpty ? 1 : 0)\n"
    case 553: // front
      res += "\(q.front ?? -1)\n"
    case 401: // back
      res += "\(q.back ?? -1)\n"
    default: // push
      q.enqueue(file.readInt())
    }
  }
  print(res)
}

solution()
