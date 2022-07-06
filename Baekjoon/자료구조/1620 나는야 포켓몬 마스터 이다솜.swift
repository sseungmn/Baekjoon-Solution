let line = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = line[0], m = line[1]
var numDict = [Int: String]()
var strDict = [String: Int]()

for i in 1...n {
  let poketmon = readLine()!
  numDict[i] = poketmon
  strDict[poketmon] = i
}
var ret = ""
for _ in 0..<m {
  let str = readLine()!
  if let num = Int(str) { ret += "\(numDict[num]!)\n" }
  else { ret += "\(strDict[str]!)\n"}
}
print(ret)

// 숫자는 index로 활용할 수 있기 때문에, Array를 사용해도 된다.
