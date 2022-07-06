// 9:30
// 원소의 크기가 100_000_000이하이므로, index로 활용할 수 없음
// A, B 배열을 하나의 Set(합집합)에 넣음 -> O(N)
// A, B의 교집합을 구함 -> O(min(A, B))
// 대칭차집합 개수를 구함 -> O(N)
// 2 * O(N) + O(min(A, B))
// ---
// A-B를 구함 -> O(A)
// B-A를 구함 -> O(B)
// 개수를 구함 -> O(1)
// O(N)
let line = readLine()!.split { $0 == " " }.map { Int($0)! }
let a = line[0], b = line[1]
var A = Set(readLine()!.split { $0 == " " }.map { Int($0)! })
var B = Set(readLine()!.split { $0 == " " }.map { Int($0)! })
var cnt = 0
B.forEach { cnt += A.contains($0) ? 0 : 1 }
A.forEach { cnt += B.contains($0) ? 0 : 1 }
print(cnt)
