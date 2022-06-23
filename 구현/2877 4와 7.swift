import Foundation
// 2^29 < 10^9 < 2^30
let n = Int(readLine()!)!
/// 몇 자리 수 인지 알아내기
/// 1phase까지 합: 2  (2^2 - 2)까지는 1자리수
/// 2phase까지 합: 6  (2^3 - 2)까지는 2자리수
/// 3phase까지 합: 14 (2^4 - 2)까지는 3자리수
/// 4phase까지 합: 30 (2^5 - 2)까지는 4자리수
var digitNumber = 0
while true {
  if Int(pow(2, Double(digitNumber + 1))) - 2 >= n { break }
  digitNumber += 1
}
let startPoint = Int(pow(2, Double(digitNumber))) - 1

var num = n - startPoint
var ret = ""
for i in (0..<digitNumber).reversed() {
  let tmp = num / Int(pow(2, Double(i)))
  ret += tmp == 0 ? "4" : "7"
  num -= tmp * Int(pow(2, Double(i)))
}
print(ret)
