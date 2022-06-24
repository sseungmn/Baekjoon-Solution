var line = readLine()!.split(separator: " ").map { Int($0)! }
let h = line[0], w = line[1]

line = readLine()!.split(separator: " ").map { Int ($0)! }

var ret = 0
for y in 1...h {
  var last = -1
  for x in 0..<w {
    if line[x] >= y { // 기준높이보다 높으면 물을 채울 수 있음
      if last != -1 { // 이 전에 높은 블럭이 이미 있다면 그 블럭과 현재 블럭 사이에 물을 채운다
        ret += (x - last - 1)      
      }
      last = x
    }
  }
}
print(ret)
