// 6:36
let a = UnicodeScalar("a").value
var ret = 0
for _ in 0..<Int(readLine()!)! {
  if validate() { ret += 1 }
}

func validate() -> Bool {
  var check = [Bool](repeating: false, count: 26)
  let word = readLine()!.map { Int(UnicodeScalar(String($0))!.value - a) }
  var index = 0
  while index < word.count {
    guard !check[word[index]] else { return false }
    let cur = word[index]
    check[cur] = true
    while index < word.count && word[index] == cur { index += 1 }
  }
  return true
}

print(ret)
