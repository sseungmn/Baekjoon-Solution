let A = Character("A").asciiValue!
let line = readLine()!.split(separator: " ").map { Int($0)! }
var n = line[0], b = line[1]

var arr = [Int]()
while n > 0 {
  arr.append(n % b)
  n /= b
}
print(arr
  .reversed()
  .map { $0 >= 10 ? String(UnicodeScalar(UInt8($0 - 10) + A)) : String($0) }
  .joined(separator: "")
)
