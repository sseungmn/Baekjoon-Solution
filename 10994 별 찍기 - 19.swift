let n = Int(readLine()!)!

func reculsive(_ num: Int) -> [String] {
  if num == 1 { return ["*"] }
  var ret = [String]()
  var starLine = ""
  var emptyLine = ""
  let max = 4*num-3
  for i in 0..<max {
    if i == 0 || i == max-1 { starLine += "*"; emptyLine += "*" }
    else { starLine += "*"; emptyLine += " " }
  }

  ret.append(starLine)
  ret.append(emptyLine)
  for innerLine in reculsive(num - 1) {
    var line = "* "
    line += innerLine
    line += " *"
    ret.append(line)
  }
  ret.append(emptyLine)
  ret.append(starLine)
  return ret
}

print(reculsive(n).joined(separator: "\n"))
