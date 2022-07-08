// 13:17
// L개의 알파벳, 최소 한 개의 모음, 두 개의 자음
// 증가하는 순서로 배열
// C개의 문자 중 L개를 선택
// 3 <= L <= C <= 15
let line = readLine()!.split { $0 == " " }.map { Int($0)! }
let l = line[0], c = line[1]
let alpha = readLine()!.split{ $0 == " " }.sorted()

var ret = [String]()
// 현재 순번의 알파벳이 모음이면 모음의 개수 +, 자음이면 자음의 개수 +
func recursion(_ picked: [Substring], _ index: Int, _ cv: Int, _ cc: Int) {
  if picked.count == l && cv >= 1 && cc >= 2 { ret.append(picked.joined()); return }
  if index == c { return }
  var tmp = picked
  tmp.append(alpha[index])
  recursion(picked, index + 1, cv, cc)
  if ["a", "e", "i", "o", "u"].contains(alpha[index]) { recursion(tmp, index + 1, cv + 1, cc) }
  else { recursion(tmp, index + 1, cv, cc + 1) }
}
recursion([], 0, 0, 0)
print(ret.reversed().joined(separator: "\n"))
