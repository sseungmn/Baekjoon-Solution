struct Heap<T> {
  private var heap: [T] = []
  private let cmp: (T, T) -> Bool

  init(_ heap: [T] = [], by cmp: @escaping (T, T) -> Bool) {
    self.heap.append(heap[0])
    self.cmp = cmp
    heap.forEach { push($0) }
  }

  mutating func push(_ elem: T) {
    heap.append(elem)
    var index = heap.count - 1
    while index > 1 && cmp(heap[index], heap[index/2]) {
      heap.swapAt(index/2, index)
      index /= 2
    }
  }

  mutating func pop() -> T? {
    guard heap.count > 1 else { return nil }
    heap.swapAt(1, heap.count - 1)
    let ret = heap.removeLast()
    var parent = 1
    while parent * 2 < heap.count {
      var candidate = parent
      let left = parent * 2
      let right = parent * 2 + 1
      if left < heap.count && cmp(heap[left], heap[candidate]) { candidate = parent * 2 }
      if right < heap.count && cmp(heap[right], heap[candidate]) { candidate = parent * 2 + 1 }
      if candidate == parent { break }
      heap.swapAt(candidate, parent)
      parent = candidate
    }
    return ret
  }
  var isEmpty: Bool { return heap.count <= 1 }
  var count: Int { return heap.count - 1 }
}

for _ in 0..<Int(readLine()!)! {
  let _ = Int(readLine()!)!
  let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
  var heap = Heap(arr, by: <)
  var ret = 0
  while heap.count > 1 {
    let tmp = heap.pop()! + heap.pop()!
    ret += tmp
    heap.push(tmp)
  }
  print(ret)
}
