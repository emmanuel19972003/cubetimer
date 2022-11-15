import UIKit
import SwiftUI
import Foundation
var dasfa:String = ""
struct Insect: Codable {
    let insectId: Int
    let name: String
    let isHelpful: Bool
}
let RegSeciones:[String:secionInfo] = ["Emmanuel":secionInfo(name: "SeonP", tipo: "3x3", tiempos: [3.0,3], Best: 12.3, worst: 32.5, Scrable: ["R U", "L D"], DateOfScrambel: [])]
//print(RegSeciones["Emmanuel"] as? secionInfo)
//info:[String:secionInfo]

var dic:[String:Any] = [
    "Emmanuel":"Emma",
    "Edad" : 10,
    "Singe": true
]
print(dic)
dic.removeValue(forKey: "Edad")
print(RegSeciones["Emmanuel"]?.promedio)


