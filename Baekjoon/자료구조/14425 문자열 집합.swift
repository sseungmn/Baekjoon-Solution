// N개의 문자열에서 M번 존재유무를 확인해야한다.
// Set으로 하면, insert: O(logN), subscript: O(1)
// Dictionary로 하면, insert: O(1), subscript: O(1)
// 같은 문자열이 여러번 주어지지 않기에, Dictionary로 구현해도 좋을 것 같다.
let line = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = line[0], m = line[1]
var dict: [String: Int] = [:]
for _ in 0..<n { dict[readLine()!] = 1 }
var cnt = 0
for _ in 0..<m { if dict[readLine()!] != nil { cnt += 1} }
print(cnt)
