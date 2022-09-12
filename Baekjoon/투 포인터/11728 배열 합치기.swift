import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}
let fileIO = FileIO()
let (n, m) = (fileIO.readInt(), fileIO.readInt())
var a = [Int](), b = [Int]()
for _ in 0..<n { a.append(fileIO.readInt()) }
for _ in 0..<m { b.append(fileIO.readInt()) }

var ret = ""
var pa = 0, pb = 0
while pa < a.count && pb < b.count {
  if a[pa] < b[pb] {
    ret += "\(a[pa]) "
    pa += 1
  } else if a[pa] >= b[pb] {
    ret += "\(b[pb]) "
    pb += 1
  }
}
while pa < n {
  ret += "\(a[pa]) "
  pa += 1
}

while pb < m {
  ret += "\(b[pb]) "
  pb += 1
}

print(ret)
