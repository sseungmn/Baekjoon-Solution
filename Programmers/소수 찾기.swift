import Foundation

func solution(_ numbers:String) -> Int {
    isPrime[0] = false; isPrime[1] = false
    calcPrimes()

    var allCases = Set<Int>()
    // input으로 madeNumbers[i]가 들어온다.
    func permutation(_ str: String) {
        let strArr = Array(str).map { String($0) }
        var visited = [Bool](repeating: false, count: strArr.count)

        func perm(_ picked: String, _ index: Int) {
            if let num = Int(picked) {
                print(num)
                if isPrime[num] { allCases.insert(num) }
            }
            if index == strArr.count { return }

            for i in 0..<strArr.count {
                if visited[i] { continue }
                visited[i] = true
                perm(picked + strArr[i], index + 1)
                visited[i] = false
            }
        }
        perm("", 0)
    }
    permutation(numbers)
    return allCases.count
}


let max = 10000000
var isPrime = [Bool](repeating: true, count: max)
func calcPrimes() {
    for i in 2..<max {
        if isPrime[i] {
            var tmp = i + i
            while tmp < max {
                isPrime[tmp] = false
                tmp += i
            }
        }
    }
}
