//
//  7x7Cube.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 5/17/22.
//

import Foundation
import SwiftUI
struct Thecube7x7{
    var size:Int
    var g: [[Color]] = [[]]
    var w: [[Color]] = [[]]
    var r: [[Color]] = [[]]
    var o: [[Color]] = [[]]
    var b: [[Color]] = [[]]
    var y: [[Color]] = [[]]
    init(size:Int){
        self.size = size
        for _ in 0..<size-1{
            g.append([])
            w.append([])
            r.append([])
            o.append([])
            b.append([])
            y.append([])
        }
        for i in 0..<size{
            for _ in 0..<size{
                g[i].append(.green)
                w[i].append(.white)
                r[i].append(.red)
                o[i].append(.orange)
                b[i].append(.blue)
                y[i].append(.yellow)
            }
        }
    }
    func rotate(Matriz:[[Color]])->[[Color]]{
        var matizfinal = Matriz
        for i in 0..<size{
            for j in 0..<size{
                matizfinal[i][j] = Matriz [(size-1)-j][i]
            }
        }
        
        return matizfinal
    }
    func permutar(Matriz1:[[Color]],Matriz2:[[Color]],Matriz3:[[Color]],Matriz4:[[Color]])->([[Color]],[[Color]],[[Color]],[[Color]]){
        var matizfinal1 = Matriz1
        var matizfinal2 = Matriz2
        var matizfinal3 = Matriz3
        var matizfinal4 = Matriz4
        let cz = self.size - 1
        for i in 0...cz{
            matizfinal1[i][cz] = Matriz4[0][i]
            matizfinal2[cz][cz-i] = Matriz1[i][cz]
            matizfinal3[i][0] = Matriz2[cz][i]
            matizfinal4[0][cz-i] = Matriz3[i][0]
        }
        
        return (matizfinal1, matizfinal2, matizfinal3,matizfinal4)
    }
    
    func permutarW(Matriz1:[[Color]],Matriz2:[[Color]],Matriz3:[[Color]],Matriz4:[[Color]])->([[Color]],[[Color]],[[Color]],[[Color]]){
        var matizfinal1 = Matriz1
        var matizfinal2 = Matriz2
        var matizfinal3 = Matriz3
        var matizfinal4 = Matriz4
        let cz = self.size - 1
        let W = self.size - 2
        for i in 0...cz{
            matizfinal1[i][W] = Matriz4[1][i]
            matizfinal2[W][cz-i] = Matriz1[i][W]
            matizfinal3[i][1] = Matriz2[W][i]
            matizfinal4[1][cz-i] = Matriz3[i][1]
            //
            
        }
        
        return (matizfinal1, matizfinal2, matizfinal3,matizfinal4)
    }
    func permutarW3(Matriz1:[[Color]],Matriz2:[[Color]],Matriz3:[[Color]],Matriz4:[[Color]])->([[Color]],[[Color]],[[Color]],[[Color]]){
        var matizfinal1 = Matriz1
        var matizfinal2 = Matriz2
        var matizfinal3 = Matriz3
        var matizfinal4 = Matriz4
        let cz = self.size - 1
        let W = self.size - 3
        for i in 0...cz{
            matizfinal1[i][W] = Matriz4[2][i]
            matizfinal2[W][cz-i] = Matriz1[i][W]
            matizfinal3[i][2] = Matriz2[W][i]
            matizfinal4[2][cz-i] = Matriz3[i][2]
            //
            
        }
        
        return (matizfinal1, matizfinal2, matizfinal3,matizfinal4)
    }
    mutating func Fmove (){
        (self.o, self.w,self.r,self.y) = permutar(Matriz1: self.o,Matriz2: self.w,Matriz3: self.r,Matriz4: self.y)
        self.g = rotate(Matriz: self.g)
    }
    mutating func FWmove (){
        Fmove()
        (self.o, self.w,self.r,self.y) = permutarW(Matriz1: self.o,Matriz2: self.w,Matriz3: self.r,Matriz4: self.y)
        
    }
    mutating func FW3move (){
        FWmove()
        (self.o, self.w,self.r,self.y) = permutarW3(Matriz1: self.o,Matriz2: self.w,Matriz3: self.r,Matriz4: self.y)
        
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
    
    mutating func BWmove (){
        Bmove()
        for _ in 0...1{
            self.w = rotate(Matriz: self.w)
            self.y = rotate(Matriz: self.y)
        }
        
        (self.r, self.w,self.o,self.y) = permutarW(Matriz1: self.r,Matriz2: self.w,Matriz3: self.o,Matriz4: self.y)
        
        for _ in 0...1{
            self.w = rotate(Matriz: self.w)
            self.y = rotate(Matriz: self.y)
        }
    }
    
    mutating func BW3move (){
        BWmove()
        for _ in 0...1{
            self.w = rotate(Matriz: self.w)
            self.y = rotate(Matriz: self.y)
        }
        
        (self.r, self.w,self.o,self.y) = permutarW3(Matriz1: self.r,Matriz2: self.w,Matriz3: self.o,Matriz4: self.y)
        
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
    mutating func RWmove (){
        Rmove()
        for _ in 0...2{
            self.y = rotate(Matriz: self.y)
        }
        self.w = rotate(Matriz: self.w)
        (self.g, self.w,self.b,self.y) = permutarW(Matriz1: self.g,Matriz2: self.w,Matriz3: self.b,Matriz4: self.y)
        self.y = rotate(Matriz: self.y)
        for _ in 0...2{
            self.w = rotate(Matriz: self.w)
        }
    }
    mutating func RW3move (){
        RWmove()
        for _ in 0...2{
            self.y = rotate(Matriz: self.y)
        }
        self.w = rotate(Matriz: self.w)
        (self.g, self.w,self.b,self.y) = permutarW3(Matriz1: self.g,Matriz2: self.w,Matriz3: self.b,Matriz4: self.y)
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
    
    mutating func LWmove (){
        Lmove()
        for _ in 0...2{
            self.w = rotate(Matriz: self.w)
        }
        self.y = rotate(Matriz: self.y)
        (self.b, self.w,self.g,self.y) = permutarW(Matriz1: self.b,Matriz2: self.w,Matriz3: self.g,Matriz4: self.y)
        self.w = rotate(Matriz: self.w)
        for _ in 0...2{
            self.y = rotate(Matriz: self.y)
        }
    }
    
    mutating func LW3move (){
        LWmove()
        for _ in 0...2{
            self.w = rotate(Matriz: self.w)
        }
        self.y = rotate(Matriz: self.y)
        (self.b, self.w,self.g,self.y) = permutarW3(Matriz1: self.b,Matriz2: self.w,Matriz3: self.g,Matriz4: self.y)
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
    
    mutating func UWmove (){
        Umove()
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        for _ in 0...2{
            self.r = rotate(Matriz: self.r)
        }
        self.o = rotate(Matriz: self.o)
        
        (self.o, self.b,self.r,self.g) = permutarW(Matriz1: self.o,Matriz2: self.b,Matriz3: self.r,Matriz4: self.g)
        
        
        self.r = rotate(Matriz: self.r)
        for _ in 0...2{
            self.o = rotate(Matriz: self.o)
        }
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
    }
    
    mutating func UW3move (){
        UWmove()
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        for _ in 0...2{
            self.r = rotate(Matriz: self.r)
        }
        self.o = rotate(Matriz: self.o)
        
        (self.o, self.b,self.r,self.g) = permutarW3(Matriz1: self.o,Matriz2: self.b,Matriz3: self.r,Matriz4: self.g)
        
        
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
    mutating func DWmove (){
        Dmove()
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        for _ in 0...2{
            self.o = rotate(Matriz: self.o)
        }
        self.r = rotate(Matriz: self.r)
        
        
        (self.o, self.g,self.r,self.b) = permutarW(Matriz1: self.o,Matriz2: self.g,Matriz3: self.r,Matriz4: self.b)
        
        
        self.o = rotate(Matriz: self.o)
        for _ in 0...2{
            self.r = rotate(Matriz: self.r)
        }
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        
        
        
        
    }
    mutating func DW3move (){
        DWmove()
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        for _ in 0...2{
            self.o = rotate(Matriz: self.o)
        }
        self.r = rotate(Matriz: self.r)
        
        
        (self.o, self.g,self.r,self.b) = permutarW3(Matriz1: self.o,Matriz2: self.g,Matriz3: self.r,Matriz4: self.b)
        
        
        self.o = rotate(Matriz: self.o)
        for _ in 0...2{
            self.r = rotate(Matriz: self.r)
        }
        for _ in 0...1{
            self.b = rotate(Matriz: self.b)
        }
        
    }
    //["U ","U' ","U2 ","R ","R' ","R2 ","L ","L' ","L2 ","F ","F' ","F2 ","B ","B' ","B2 ","D ","D' ","D2 "]
    //["U ","U' ","U2 ","Uw ","Uw' ","Uw2 ","3Uw ","3Uw' ","3Uw2 ","R ","R' ","R2 ","Rw ","Rw' ","Rw2 ","3Rw ","3Rw' ","3Rw2 ","L ","L' ","L2 ","Lw ","Lw' ","Lw2 ","3Lw ","3Lw' ","3Lw2 ","F ","F' ","F2 ","Fw ","Fw' ","Fw2 ","3Fw ","3Fw' ","3Fw2 ","B ","B' ","B2 ","Bw ","Bw' ","Bw2 ","3Bw ","3Bw' ","3Bw2 ","D ","D' ","D2 ","Dw ","Dw' ","Dw2 ","3Dw ","3Dw' ","3Dw2 "]
    mutating func MakeScramble(scrambleToDo:String){
        //et fullNameArr = fullName.componentsSeparatedByString(" ")
        let SplitArry = scrambleToDo.split(separator: " ")
        var contador = 1
        for i in 0..<SplitArry.count{
            let Primeraletra = Theletter(word: String(SplitArry[i]), np: 0)
            var segundaletra = " "
            if (SplitArry[i].count > 1){
                segundaletra = Theletter(word: String(SplitArry[i]), np: 1)
            }
            
            let ultimaletra = Theletter(word: String(SplitArry[i]), np: SplitArry[i].count-1)
            if (ultimaletra == "2"){
                contador = 2
            }else if (ultimaletra == "'"){//es puede mejorar colocando ultima pos -2
                contador = 3
            }else{
                contador = 1
            }
            
            
            for _ in 0..<contador{
                if (Primeraletra == "U"){
                    if (segundaletra == "w"){
                        self.UWmove()
                    }else{
                        self.Umove()

                    }

                }
                else if (Primeraletra == "R"){
                    if (segundaletra == "w"){
                        self.RWmove()

                    }else{
                        self.Rmove()

                    }

                }else if (Primeraletra == "L"){
                    if (segundaletra == "w"){
                        self.LWmove()

                    }else{
                        self.Lmove()

                    }

                }else if (Primeraletra == "F"){
                    if (segundaletra == "w"){
                        self.FWmove()

                    }else{
                        self.Fmove()

                    }
                }else if (Primeraletra == "B"){
                    if (segundaletra == "w"){
                        self.BWmove()

                    }else{
                        self.Bmove()

                    }
                }else if (Primeraletra == "D"){
                    if (segundaletra == "w"){
                        self.DWmove()

                    }else{
                        self.Dmove()

                    }
                }
                else if (Primeraletra == "3"){
                    if (segundaletra == "U"){
                        self.UW3move()
                        print("U")
                    }
                    else if (segundaletra == "R"){
                        self.RW3move()
                        print("R")
                    }else if (segundaletra == "L"){
                        self.LW3move()
                        print("L")
                    }else if (segundaletra == "F"){
                        self.FW3move()
                        print("F")
                    }else if (segundaletra == "B"){
                        self.BW3move()
                        print("B")
                    }else if (segundaletra == "D"){
                        self.DW3move()
                        print("D")
                    }
                }

            }
            
        }
        
    }


    
    
}
