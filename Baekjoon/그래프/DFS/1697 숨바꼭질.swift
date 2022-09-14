struct Queue<T> {
  private var enqueue = [T]()
  private var dequeue = [T]()
  
  var isEmpty: Bool { enqueue.isEmpty && dequeue.isEmpty }
  
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

let MAX = 100_000

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let (n, k) = (input[0], input[1])

var check = [Int](repeating: 0, count: MAX + 1)

var queue = Queue<Int>()
queue.push(n)

while true {
  guard let cur = queue.pop() else { break }
  if cur == k { break }
  
  for i in 0..<3 {
    var next = 0
    if i == 0 { next = cur - 1 }
    else if i == 1 { next = cur + 1 }
    else if i == 2 { next = cur * 2 }
    
    guard 0 <= next && next <= MAX,
          check[next] == 0
    else { continue }
    queue.push(next)
    check[next] = check[cur] + 1
  }
}
print(check[k])
