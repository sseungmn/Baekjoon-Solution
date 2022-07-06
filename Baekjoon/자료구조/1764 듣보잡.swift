let line = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = line[0], m = line[1]

var ns = Set<String>()
for _ in 0..<n { ns.insert(readLine()!) }
var nsh = [String]()
for _ in 0..<m {
  let name = readLine()!
  if ns.contains(name) { nsh.append(name) }
}
print(nsh.count)
print(nsh.sorted().joined(separator: "\n"))
