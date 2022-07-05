let word = readLine()!.map { String($0) }
let n = word.count
var ret = 0
var i = 0
while i < n {
  if i + 1 < n {
    if word[i] == "c" && word[i+1] == "=" || word[i+1] == "-" { i += 1 }
    else if word[i] == "d" {
      if i + 2 < n && word[i+1] == "z" && word[i+2] == "=" { i += 2 }
      else if word[i+1] == "-" { i += 1 }
    }
    else if word[i] == "l" && word[i+1] == "j" { i += 1 }
    else if word[i] == "n" && word[i+1] == "j" { i += 1 }
    else if word[i] == "s" && word[i+1] == "=" { i += 1 }
    else if word[i] == "z" && word[i+1] == "=" { i += 1 }
  }
  i += 1
  ret += 1
}
print(ret)
