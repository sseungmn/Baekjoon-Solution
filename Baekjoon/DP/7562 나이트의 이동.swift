// 7562 나이트의 이동
// 22:10
typealias Pair = (x: Int, y: Int)
struct Queue<T> {
    private var enqueue: [T] = []
    private var dequeue: [T] = []
    
    var isEmpty: Bool { return enqueue.isEmpty && dequeue.isEmpty }
    
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

let t = Int(readLine()!)!

func line() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

(0..<t).forEach { _ in
    let n = Int(readLine()!)!
    var check = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    var input = line()
    let start = Pair(input[0], input[1])
    input = line()
    let end = Pair(input[0], input[1])
    
    if start == end {
        print("0")
        return
    }
    
    let dx = [1, 2, 2, 1, -1, -2, -2, -1]
    let dy = [-2, -1, 1, 2, 2, 1, -1, -2]
    
    var queue = Queue<Pair>()
    queue.push(start)
    check[start.y][start.x] = 1
    
    while !queue.isEmpty {
        guard let cur = queue.pop() else { return }
        
        for i in 0..<8 {
            let nx = cur.x + dx[i], ny = cur.y + dy[i]
            guard 0..<n ~= nx, (0..<n) ~= ny,
                  check[ny][nx] == 0
            else { continue }
            
            queue.push(Pair(nx, ny))
            check[ny][nx] = check[cur.y][cur.x] + 1
            if Pair(nx, ny) == end {
                print(check[ny][nx] - 1)
                return
            }
        }
    }
}
