// 02:13:50
import Foundation

func solution(_ lines:[String]) -> Int {
    var timeline = [(Double, Double)]()
    
    for line in lines {
        let line = line.split(separator: " ")
        let time = line[1].split(separator: ":").map { Double(String($0))! }
        let endSec = round((time[0] * 3600 + time[1] * 60 + time[2]) * 1000) / 1000
        let elapsedTime = round(Double(String(line[2].split(separator: "s")[0]))! * 1000) / 1000
        let startSec = round((endSec - elapsedTime + 0.001) * 1000) / 1000
        timeline.append((startSec, endSec))
    }
    timeline.sorted { return $0.0 == $1.0 ? $0.1 <= $1.1 : $0.0 < $1.0 }
    
    var ret = 0
    for i in timeline.indices {
        let cur = timeline[i]
        let startLimit = round((cur.0 + 1 - 0.001) * 1000) / 1000
        var startCount = 1
        let endLimit = round((cur.1 + 1 - 0.001) * 1000) / 1000
        var endCount = 1
        for j in timeline.indices {
            if i == j { continue }
            // 시작시간을 기준으로
            let target = timeline[j]
            // 1 | 2 | 3 구간으로 나눠서
            // 1, 1 + 2, 2, 2 + 3, 1 + 2 + 3, 3 구간에 해당하는 요청의 개수를 구한다.
            if abs(target.1 - cur.0) < 0.0001 { startCount += 1 }
            else if target.0 <= cur.0 && cur.0 <= target.1 && target.1 <= startLimit { startCount += 1 }
            else if cur.0 <= target.0 && target.1 <= startLimit { startCount += 1 }
            else if cur.0 <= target.0 && target.0 <= startLimit && startLimit <= target.1 { startCount += 1 }
            else if target.0 <= cur.0 && startLimit <= target.1 { startCount += 1 }
            else if abs(startLimit - target.0) < 0.0001 { startCount += 1 }
            // 끝시간을 기준으로
            // 1 | 2 | 3 구간으로 나눠서
            // 1, 1 + 2, 2, 2 + 3, 1 + 2 + 3, 3 구간에 해당하는 요청의 개수를 구한다.
            if abs(target.1 - cur.1) < 0.0001 { endCount += 1 }
            else if target.0 <= cur.1 && cur.1 <= target.1 && target.1 <= endLimit { endCount += 1 }
            else if cur.1 <= target.0 && target.1 <= endLimit { endCount += 1 }
            else if cur.1 <= target.0 && target.0 <= endLimit && endLimit <= target.1 { endCount += 1 }
            else if target.0 <= cur.1 && endLimit <= target.1 { endCount += 1 }
            else if abs(endLimit - target.0) < 0.0001 { endCount += 1 }
        }
        ret = max(ret, startCount, endCount)
    }
    return ret
}
