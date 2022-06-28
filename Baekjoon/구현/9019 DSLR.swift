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
}

struct Queue<T> {
  private var enqueue: [T]
  private var dequeue: [T] = []
  
  init(_ enqueue: [T] = []) {
    self.enqueue = enqueue
  }
  
  var isEmpty: Bool {
    return enqueue.isEmpty && dequeue.isEmpty
  }
  
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

typealias Item = (num: Int, query: Int)

//let fileIO = FileIO()
var ret = ""

//for _ in 0..<fileIO.readInt() {
//  let source = fileIO.readInt(), target = fileIO.readInt()
for _ in 0..<Int(readLine()!)! {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  let source = line[0], target = line[1]
  
  var check = [Bool](repeating: false, count: 10000)
  
  var queue = Queue<Item>()
  queue.push(Item(source, 0))
  check[source] = true
  
  loop: while true {
    guard let curItem = queue.pop() else { break loop }
    
    let D = Item(num : curItem.num * 2 % 10000, query: curItem.query * 10 + 1)
    let S = Item(num : curItem.num == 0 ? 9999 : curItem.num - 1, query: curItem.query * 10 + 2)
    let L = Item(num : (curItem.num % 1000) * 10 + curItem.num / 1000, query: curItem.query * 10 + 3)
    let R = Item(num : curItem.num / 10 + (curItem.num % 10) * 1000, query: curItem.query * 10 + 4)
    
    for item in [D, S, L, R] {
      if check[item.num] { continue }
      if item.num == target {
        var x = item.query
        var query = ""
        let operation = ["", "D", "S", "L", "R"]
        while x > 0 {
          query += operation[x % 10]
          x /= 10
        }
        ret += "\(String(query.reversed()))\n"
        break loop
      }
      check[item.num] = true
      queue.push(item)
    }
  }
}

ret.removeLast()
print(ret)
