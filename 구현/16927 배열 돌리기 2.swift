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
}

let fileIO = FileIO()
let h = fileIO.readInt(), w = fileIO.readInt(), r = fileIO.readInt()
var board = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
for y in 0..<h { for x in 0..<w { board[y][x] = fileIO.readInt() }}
// 오, 아, 왼, 위
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

func straighten(with phase: Int, _ len: Int) -> [Int] {
  var oneDimArr = [Int](repeating: 0, count: len)
  
  var x = phase, y = phase
  var k = 0, i = 0
  while i < len {
    oneDimArr[i] = board[y][x]
    
    let nx = x + dx[k]
    let ny = y + dy[k]
    if phase <= nx && nx < w-phase,
       phase <= ny && ny < h-phase {
      y = ny; x = nx
      i += 1
    } else {
      k += 1
    }
  }
  return oneDimArr
}

func shiftLeft(_ arr: inout [Int], _ offset: Int) {
  let left = arr[offset..<arr.count]
  let right = arr[0..<offset]
  arr = Array(left + right)
}

func bentArray(_ arr: [Int], _ phase: Int, _ len: Int) {
  var x = phase, y = phase
  var k = 0, i = 0
  while i < len {
    board[y][x] = arr[i]
    
    let nx = x + dx[k]
    let ny = y + dy[k]
    if phase <= nx && nx < w-phase,
       phase <= ny && ny < h-phase {
      y = ny; x = nx
      i += 1
    } else {
      k += 1
    }
  }
}

let maxPhase = min(w, h) / 2
for phase in 0..<maxPhase {
  // 각 phase마다 다른 주기를 계산해준다.
  let len = ((w-2 * phase)+(h-2 * phase))*2 - 4
  var oneDimArr = straighten(with: phase, len)
  let round = r % len
  shiftLeft(&oneDimArr, round)
  bentArray(oneDimArr, phase, len)
}
print(board.map { $0.map { String($0)}.joined(separator: " ") }.joined(separator: "\n"))
