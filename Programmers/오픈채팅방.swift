import Foundation

func solution(_ record:[String]) -> [String] {
    var users = [String: String]()
    for line in record {
        let components = line.split(separator: " ").map { String($0) }
        if components[0] == "Enter" || components[0] == "Change" {
            users[components[1]] = components[2]
        }
    }
    var ret = [String]()
    for line in record {
        let components = line.split(separator: " ").map { String($0) }
        let user = users[components[1]]!
        if components[0] == "Enter" {
            ret.append("\(user)님이 들어왔습니다.")
        } else if components[0] == "Leave" {
            ret.append("\(user)님이 나갔습니다.")
        }
    }
    return ret
}
