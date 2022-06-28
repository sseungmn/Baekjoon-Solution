import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    func recur(_ index: Int, _ partialResult: Int) {
        if index == numbers.count {
            if partialResult == target { count += 1 }
            return
        }
        recur(index + 1, partialResult + numbers[index])
        recur(index + 1, partialResult - numbers[index])
    }
    recur(0, 0)
    return count
}
