let t = Int(readLine()!)!
var ret = ""
let A = Character("A").asciiValue!
for _ in 0..<t {
  let word = readLine()!
  var indexedWord = word.map { Int($0.asciiValue! - A) }

  var targetIndex = -1
  for i in (0..<indexedWord.count - 1).reversed() {
    if indexedWord[i] < indexedWord[i + 1] { targetIndex = i; break } // 뒤에서부터 오름차순이 끊긴 상황
  }
  if targetIndex == -1 { ret += "\(word)\n"; continue }

  var minIndex = targetIndex + 1
  for j in targetIndex+1..<indexedWord.count {
    if indexedWord[targetIndex] < indexedWord[j] && indexedWord[j] < indexedWord[minIndex] { minIndex = j }
  }

  indexedWord.swapAt(targetIndex, minIndex)
  indexedWord[targetIndex+1..<indexedWord.count].sort()
  ret += "\(indexedWord.map { String(UnicodeScalar(UInt8($0) + A)) }.reduce("", +))\n"
}
ret.removeLast()
print(ret)
