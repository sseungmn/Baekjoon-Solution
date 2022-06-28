import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var ret = [Int]()

    var progressStack = Array(zip(progresses.reversed(), speeds.reversed()))
    var day = 0
    while !progressStack.isEmpty {
        var count = 1
        let cur = progressStack.popLast()!
        day += Int(ceil(Double(100 - cur.0 - day * cur.1) / Double(cur.1)))
        while !progressStack.isEmpty {
            let next = progressStack.last!
            if next.0 + day * next.1 >= 100 {
                count += 1
                progressStack.removeLast()
            } else {
                break
            }
        }
        ret.append(count)
    }
    return ret
}
