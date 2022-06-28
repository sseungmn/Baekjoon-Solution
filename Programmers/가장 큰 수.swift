import Foundation

func solution(_ numbers:[Int]) -> String {
    let ret = numbers
    .map { String($0) }
    .sorted { Int($0 + $1)! > Int($1 + $0)! }
    .joined()
    return Int(ret) == Optional(0) ? "0" : ret
}
