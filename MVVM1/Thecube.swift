//
//  Thecube.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/6/22.
//

import Foundation
import UIKit
import SwiftUI
struct Thecube{
    var g: [[Color]] = [[.green,.green,.green],[.green,.green,.green],[.green,.green,.green]]
    var w: [[Color]] = [[.white,.white,.white],[.white,.white,.white],[.white,.white,.white]]
    var r: [[Color]] = [[.red,.red,.red],[.red,.red,.red],[.red,.red,.red]]
    var o: [[Color]] = [[.orange,.orange,.orange],[.orange,.orange,.orange],[.orange,.orange,.orange]]
    var b: [[Color]] = [[.blue,.blue,.blue],[.blue,.blue,.blue],[.blue,.blue,.blue]]
    var y: [[Color]] = [[.yellow,.yellow,.yellow],[.yellow,.yellow,.yellow],[.yellow,.yellow,.yellow]]
    
    func rotate(Matriz:[[Color]])->[[Color]]{
        var matizfinal = Matriz
        for i in 0...2{
            for j in 0...2{
                matizfinal[i][j] = Matriz [2-j][i]
            }
        }

        return matizfinal
    }
    //a esta funcion le asgino 4 caras bayasentes para rotar sus piesas
    func permutar(Matriz1:[[Color]],Matriz2:[[Color]],Matriz3:[[Color]],Matriz4:[[Color]])->[[Color]]{
        var matizfinal = Matriz1
        for i in 0...2{
            for j in 0...2{
                matizfinal[i][j] = Matriz1 [2-j][i]
            }
        }

        return matizfinal
    }
}







