func solution(_ n: Int, _ k: Int) -> String {
  var arr = Array(1...n)
  var index = 0
  var ret = "<"
  while !arr.isEmpty {
    index = (index + k - 1) % arr.count
    let num = arr.remove(at: index)
    ret += "\(num), "
  }
  ret.removeLast()
  ret.removeLast()
  ret += ">"
  return ret
}

let line = readLine()!.split(separator: " ").map { Int($0)! }
var n = line[0], k = line[1]
print(solution(n, k))
