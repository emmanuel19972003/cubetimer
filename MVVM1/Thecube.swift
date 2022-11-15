//
//  Thecube.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/6/22.
//

import Foundation
import UIKit
import SwiftUI
var Moves:[[String]] = [["U ","U' ","U2 ","R ","R' ","R2 ","L ","L' ","L2 ","F ","F' ","F2 ","B ","B' ","B2 ","D ","D' ","D2 "],
    ["U ","U' ","U2 ","Uw ","Uw' ","Uw2 ","R ","R' ","R2 ","Rw ","Rw' ","Rw2 ","L ","L' ","L2 ","Lw ","Lw' ","Lw2 ","F ","F' ","F2 ","Fw ","Fw' ","Fw2 ","B ","B' ","B2 ","Bw ","Bw' ","Bw2 ","D ","D' ","D2 ","Dw ","Dw' ","Dw2 "],
    ["U ","U' ","U2 ","Uw ","Uw' ","Uw2 ","3Uw ","3Uw' ","3Uw2 ","R ","R' ","R2 ","Rw ","Rw' ","Rw2 ","3Rw ","3Rw' ","3Rw2 ","L ","L' ","L2 ","Lw ","Lw' ","Lw2 ","3Lw ","3Lw' ","3Lw2 ","F ","F' ","F2 ","Fw ","Fw' ","Fw2 ","3Fw ","3Fw' ","3Fw2 ","B ","B' ","B2 ","Bw ","Bw' ","Bw2 ","3Bw ","3Bw' ","3Bw2 ","D ","D' ","D2 ","Dw ","Dw' ","Dw2 ","3Dw ","3Dw' ","3Dw2 "],
    ["U ","U' ","R ","R' ","L ","L' ","B ","B' "],
    ["U ","U' ","U2 ","R ","R' ","R2 ","F ","F' ","F2 "]
]
let singelMoves:[String] = ["R","L","U","D","F","B"]
let opuestos1 = ["R": 1, "U": 2,"F": 3,"L": 1, "D": 2,"B": 3]
struct Thecube{
    var g: [[Color]] = [[.green,.green,.green],[.green,.green,.green],[.green,.green,.green]]
    var w: [[Color]] = [[.white,.white,.white],[.white,.white,.white],[.white,.white,.white]]
    var r: [[Color]] = [[.red,.red,.red],[.red,.red,.red],[.red,.red,.red]]
    var o: [[Color]] = [[.orange,.orange,.orange],[.orange,.orange,.orange],[.orange,.orange,.orange]]
    var b: [[Color]] = [[.blue,.blue,.blue],[.blue,.blue,.blue],[.blue,.blue,.blue]]
    var y: [[Color]] = [[.yellow,.yellow,.yellow],[.yellow,.yellow,.yellow],[.yellow,.yellow,.yellow]]
    
    mutating func resett(){
        self.g = [[.green,.green,.green],[.green,.green,.green],[.green,.green,.green]]
        self.w = [[.white,.white,.white],[.white,.white,.white],[.white,.white,.white]]
        self.r = [[.red,.red,.red],[.red,.red,.red],[.red,.red,.red]]
        self.o = [[.orange,.orange,.orange],[.orange,.orange,.orange],[.orange,.orange,.orange]]
        self.b = [[.blue,.blue,.blue],[.blue,.blue,.blue],[.blue,.blue,.blue]]
        self.y = [[.yellow,.yellow,.yellow],[.yellow,.yellow,.yellow],[.yellow,.yellow,.yellow]]
    }
    func Scramble(Type:String)->[String]{
        var CubeSize = 0
        var n = 0
        var cosa = ""
        var TheScramble = ""
        if (Type == "Clock"){
            var esquinas = ["UR","DR","LD","UL"]
            n = Int.random(in: -5...6)
            TheScramble += "UR\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "DR\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "DL\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "UL\(n) "
            
            n = Int.random(in: -5...6)
            TheScramble += "U\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "R\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "D\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "L\(n) "
            
            n = Int.random(in: -5...6)
            TheScramble += "ALL\(n) "
            
            TheScramble += "y2 "
            
            // UR1+ DR0+ DL2- UL1+ U5- R6+ D3- L4- ALL2- y2 U5- R2+ D1+ L5+ ALL2+ UL
            n = Int.random(in: -5...6)
            TheScramble += "U\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "R\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "D\(n) "
            n = Int.random(in: -5...6)
            TheScramble += "L\(n) "
            
            n = Int.random(in: -5...6)
            TheScramble += "ALL\(n) "
            n = Int.random(in: 0...3)
            
            for _ in (0...n){
                let p = Int.random(in: 0...(esquinas.count - 1))
                TheScramble += "\(esquinas[p]) "
                esquinas.remove(at: p)
            }
            
            
            
        }else if (Type == "Megaminx"){
            var signos = "++"
            for _ in (0..<7){
                for j in (0..<10){
                    n = Int.random(in: 0...1)
                    if (n % 2 == 0 ){signos = "++"} else{signos = "--"}
                    if (j % 2 == 0){
                        TheScramble += "R\(signos) "
                    }else{
                        TheScramble += "D\(signos) "
                    }
                }
                n = Int.random(in: 0...1)
                if (n % 2 == 0 ){TheScramble += "U "} else{TheScramble += "U' "}
                TheScramble += "\n"
            }
        }
        else{
            
            if (Type == "7x7" || Type == "6x6"){
                n = 65
                CubeSize = 2
            }else if (Type == "4x4" || Type == "5x5"){
                n = 40
                CubeSize = 1
            }else if (Type == "2x2"){
                n = 9
                CubeSize = 4
            }
            else if (Type == "Pyraminx" || Type == "Skewb"){
                n = Int.random(in: 7..<10)
                CubeSize = 3
            }
            else { //defalut 3x3
                n = Int.random(in: 16..<21)
                CubeSize = 0
            }
            
            
            var current = 0
            var past = Int.random(in: 0..<Moves[CubeSize].count)
            
            var i = 0
            
            while (i < n){
                current = Int.random(in: 0..<Moves[CubeSize].count)
                let PrimeraLetraAcual = Moves[CubeSize][current].firstLetter()
                let PrimeraLetraPasada = Moves[CubeSize][past].firstLetter()
                if (PrimeraLetraAcual == PrimeraLetraPasada){
                    
                }else{
                    if (opuestos1[PrimeraLetraAcual] == opuestos1[PrimeraLetraPasada]){
                        
                    }else{
                        TheScramble += Moves[CubeSize][current]
                        cosa +=  Moves[CubeSize][current].firstLetter()
                        past=current
                        i+=1
                        
                    }
                    
                }
                
                
            }
            cosa += "\(n)"
        }
        if (Type == "Pyraminx"){
            var esquinas = ["l","r","u","b"]
            n = Int.random(in: 0...3)
            for _ in (0...n){
                let p = Int.random(in: 0...(esquinas.count - 1))
                TheScramble += "\(esquinas[p])"
                esquinas.remove(at: p)
                let n = Int.random(in: 0...1)
                if (n % 2 == 0 ){TheScramble += " "} else{TheScramble += "' "}
            }
        }
        
        return [TheScramble,cosa]
        
    }
    
    mutating func MakeScramble(scrambleToDo:String){
        //et fullNameArr = fullName.componentsSeparatedByString(" ")
        let SplitArry = scrambleToDo.split(separator: " ")
        var contador = 0
        
        
        for i in 0..<SplitArry.count{
            let Primeraletra = Theletter(word: String(SplitArry[i]), np: 0)
            if (SplitArry[i].count == 1){
                contador = 1
            }else if (Theletter(word: String(SplitArry[i]), np: 1) == "2"){//es puede mejorar colocando ultima pos -2
                contador = 2
            }else{
                contador = 3
            }
            for _ in 0..<contador{
                if (Primeraletra == "U"){
                    self.Umove()
                    print("U")
                }
                else if (Primeraletra == "R"){
                    self.Rmove()
                    print("R")
                }else if (Primeraletra == "L"){
                    self.Lmove()
                    print("L")
                }else if (Primeraletra == "F"){
                    self.Fmove()
                    print("F")
                }else if (Primeraletra == "B"){
                    self.Bmove()
                    print("B")
                }else if (Primeraletra == "D"){
                    self.Dmove()
                    print("D")
                }
            }
            
        }
        
    }
    
    func rotate(Matriz:[[Color]])->[[Color]]{
        
        var matizfinal = Matriz
        for i in 0...2{
            for j in 0...2{
                matizfinal[i][j] = Matriz [2-j][i]
            }
        }
        
        return matizfinal
    }
    
    mutating func Fmove (){
        (self.o, self.w,self.r,self.y) = permutar(Matriz1: self.o,Matriz2: self.w,Matriz3: self.r,Matriz4: self.y)
        self.g = rotate(Matriz: self.g)
    }
    mutating func Bmove (){
        for _ in 0...1{
            self.w = rotate(Matriz: self.w)
            self.y = rotate(Matriz: self.y)
        }
        
        (self.r, self.w,self.o,self.y) = permutar(Matriz1: self.r,Matriz2: self.w,Matriz3: self.o,Matriz4: self.y)
        self.b = rotate(Matriz: self.b)
        
        for _ in 0...1{
            self.w = rotate(Matriz: self.w)
            self.y = rotate(Matriz: self.y)
        }
    }
    mutating func Rmove (){
        for _ in 0...2{
            self.y = rotate(Matriz: self.y)
        }
        self.w = rotate(Matriz: self.w)
        (self.g, self.w,self.b,self.y) = permutar(Matriz1: self.g,Matriz2: self.w,Matriz3: self.b,Matriz4: self.y)
        self.r = rotate(Matriz: self.r)
        self.y = rotate(Matriz: self.y)
        for _ in 0...2{
            self.w = rotate(Matriz: self.w)
        }
    }
    mutating func Lmove (){
        for _ in 0...2{
            self.w = rotate(Matriz: self.w)
        }
        self.y = rotate(Matriz: self.y)
        (self.b, self.w,self.g,self.y) = permutar(Matriz1: self.b,Matriz2: self.w,Matriz3: self.g,Matriz4: self.y)
        self.o = rotate(Matriz: self.o)
        self.w = rotate(Matriz: self.w)
        for _ in 0...2{
            self.y = rotate(Matriz: self.y)
        }
    }
    mutating func Umove (){
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        for _ in 0...2{
            self.r = rotate(Matriz: self.r)
        }
        self.o = rotate(Matriz: self.o)
        
        (self.o, self.b,self.r,self.g) = permutar(Matriz1: self.o,Matriz2: self.b,Matriz3: self.r,Matriz4: self.g)
        self.w = rotate(Matriz: self.w)
        
        self.r = rotate(Matriz: self.r)
        for _ in 0...2{
            self.o = rotate(Matriz: self.o)
        }
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
    }
    mutating func Dmove (){
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        for _ in 0...2{
            self.o = rotate(Matriz: self.o)
        }
        self.r = rotate(Matriz: self.r)
        
        
        (self.o, self.g,self.r,self.b) = permutar(Matriz1: self.o,Matriz2: self.g,Matriz3: self.r,Matriz4: self.b)
        self.y = rotate(Matriz: self.y)
        
        self.o = rotate(Matriz: self.o)
        for _ in 0...2{
            self.r = rotate(Matriz: self.r)
        }
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        
        
        
        
    }
    
    
    //a esta funcion le asgino 4 caras bayasentes para rotar sus piesas
    func permutar(Matriz1:[[Color]],Matriz2:[[Color]],Matriz3:[[Color]],Matriz4:[[Color]])->([[Color]],[[Color]],[[Color]],[[Color]]){
        var matizfinal1 = Matriz1
        var matizfinal2 = Matriz2
        var matizfinal3 = Matriz3
        var matizfinal4 = Matriz4
        for i in 0...2{
            matizfinal1[i][2] = Matriz4[0][i]
            matizfinal2[2][2-i] = Matriz1[i][2]
            matizfinal3[i][0] = Matriz2[2][i]
            matizfinal4[0][2-i] = Matriz3[i][0]
        }
        
        return (matizfinal1, matizfinal2, matizfinal3,matizfinal4)
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
extension String{
    func firstLetter() -> String {
        let char = self[self.index(self.startIndex, offsetBy: 0)]
        
        return String(char)
    }
}

func Theletter(word:String, np:Int) -> String {
    let char = word[word.index(word.startIndex, offsetBy: np)]
    
    return String(char)
}







