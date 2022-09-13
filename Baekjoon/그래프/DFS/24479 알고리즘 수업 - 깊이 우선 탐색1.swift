var input = readLine()!.split(separator: " ").map({ Int($0)! })
var (n, m, r) = (input[0], input[1], input[2])
var visited = [Int](repeating: 0, count: n + 1)
var edges = [[Int]](repeating: [Int](), count: n + 1)

for _ in 0..<m {
  input = readLine()!.split(separator: " ").map({ Int($0)! })
  edges[input[0]].append(input[1])
  edges[input[1]].append(input[0])
}
edges = edges.map { $0.sorted() }
var index = 1

func dfs(root: Int) {
  visited[root] = index
  index += 1
  for vertex in edges[root] {
    if visited[vertex] == 0 {
      dfs(root: vertex)
    }
  }
}

dfs(root: r)
for i in 1...n {
  print(visited[i])
}
