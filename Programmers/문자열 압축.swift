import Foundation

func solution(_ s:String) -> Int {
    var str = Array(s).map { String($0) }
    let len = str.count

    var ret = len
    for unit in 1...len {
      var start = 0, end = unit
      var pressedStr = ""

      // 현재 토큰을 기준으로 자를 수 있는데까지 자른다.
      // 만약 1번 이상 잘린다면, flag를 true로 설정한다.
      // 현재 토큰을 기준으로 자르기가 끝났다면,
      // flag가 true면 (unit + 1)을 추가, flase면 unit을 추가해준다.
      while start < end {
          let token = str[start..<end].joined()
          var count = 1
          while end + unit * count <= len {
              if token == str[start + unit * count..<end + unit * count].joined() { count += 1 }
              else { break }
          }
          pressedStr += count == 1 ? token : "\(token)\(count)"
          start += unit * count
          end = min(end + unit * count, len)
      }
      ret = min(ret, pressedStr.count)
    }
    return ret
}
