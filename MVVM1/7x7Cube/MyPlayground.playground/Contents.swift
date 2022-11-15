
import Foundation
import SwiftUI
var g: [[Color]] = [[.green,.green,.green,.green],[.green,.red,.green,.green],[.green,.green,.red,.green],[.green,.green,.green,.green]]

func rotate(Matriz:[[Color]])->[[Color]]{
    var matizfinal = Matriz
    for i in 0...3{
        for j in 0...3{
            matizfinal[i][j] = Matriz [3-j][i]
        }
    }
    
    return matizfinal
}
var thecube = Thecube7x7(size: 4)

var scrambleToDo = "U 3Dw2 RW'"
let SplitArry = scrambleToDo.split(separator: " ")
let ultimaletra = Theletter(word: String(SplitArry[2]), np: SplitArry[2].count-1)
print(ultimaletra)
