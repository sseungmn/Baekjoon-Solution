// 22:59
// while true로 반복문을 돌린다.
// 끝나는 조건은, 한 사이클에 더 이상 울음소리를 찾지 못하는 경우
// check배열로 해당 문자가 이미 활용되었는지 검사한다.
// 한 사이클에서 연속적으로 발견할 수 있는 울음소리는 한마리가 낸 소리라고 볼 수 있다.

let sound = Array(readLine()!).map { String($0) }
var check = [Bool](repeating: false, count: sound.count)
var duck = 0
var crying = ["q", "u", "a", "c", "k"]

func solution() -> Int {
  while true {
    var index = 0
    var found = false
    for i in sound.indices {
      if !check[i] && sound[i] == crying[index] {
        index += 1
        check[i] = true
        // 울음소리가 한 번 발견됨.
        if index == 5 { index = 0; found = true }
      }
    }
    // 올바르지 않은 울음소리가 포함되어 있는 경우
    if index != 0  { return -1 }
    // 이번 사이클에 울음소리를 찾지 못한 경우 반복문을 끝낸다.
    if !found { break }
    duck += 1
  }
  for flag in check { if !flag { return -1 } }
  return duck
}

print(solution())
