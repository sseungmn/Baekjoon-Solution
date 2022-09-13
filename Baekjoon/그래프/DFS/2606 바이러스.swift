let n = Int(readLine()!)!
let m = Int(readLine()!)!

var edges = [[Int]](repeating: [Int](), count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  edges[input[0]].append(input[1])
  edges[input[1]].append(input[0])
}

func dfs(root: Int) {
  visited[root] = true
  for vertex in edges[root] {
    if !visited[vertex] {
      dfs(root: vertex)
    }
  }
}

dfs(root: 1)
print(visited.filter({ $0 == true }).count - 1)
