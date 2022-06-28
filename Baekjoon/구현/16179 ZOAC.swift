let word: [Character] = Array(readLine()!)
var check = [Bool](repeating: false, count : word.count)
let len = word.count

for _ in 0..<len {
  var i = len - 1
  while check[i] { i -= 1 } // 가장 뒤에 있는 check되지 않은 문자의 index를 찾는다
  
  var minIndex = i
  
  while i >= 0 && !check[i] {
    minIndex = word[minIndex] >= word[i] ? i : minIndex
    i -= 1
  }
  check[minIndex] = true
  
  var ret = ""
  for j in 0..<len where check[j] { ret += String(word[j]) }
  print(ret)
}
