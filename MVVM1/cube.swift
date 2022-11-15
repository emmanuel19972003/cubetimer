//
//  cube.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/6/22.
//

import SwiftUI

struct cubeView: View {
    //var Thecube:Thecube = Thecube
    @State var TheScramble:String = "R2 R2 "
    @State var cube1: Thecube = Thecube()
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 8){
                VStack(spacing: 0){
                    row(Colors: cube1.w[0])
                    row(Colors: cube1.w[1])
                    row(Colors: cube1.w[2])
                }.offset(x:82)
                HStack(spacing: 8){
                    VStack(spacing: 0){//left
                        row(Colors: cube1.o[0])
                        row(Colors: cube1.o[1])
                        row(Colors: cube1.o[2])
                    }
                    VStack(spacing: 0){//center
                        row(Colors: cube1.g[0])
                        row(Colors: cube1.g[1])
                        row(Colors: cube1.g[2])
                    }
                    VStack(spacing: 0){//rigth
                        row(Colors: cube1.r[0])
                        row(Colors: cube1.r[1])
                        row(Colors: cube1.r[2])
                    }
                    VStack(spacing: 0){//far rigth
                        row(Colors: cube1.b[0])
                        row(Colors: cube1.b[1])
                        row(Colors: cube1.b[2])
                    }
                }
                VStack(spacing: 0){//down
                    row(Colors: cube1.y[0])
                    row(Colors: cube1.y[1])
                    row(Colors: cube1.y[2])
                }.offset(x:82)
                
                
            }.onAppear(perform: {
                cube1.resett()
                cube1.MakeScramble(scrambleToDo: TheScramble)
            })
            Text(TheScramble).multilineTextAlignment(.center).font(.largeTitle)
            Spacer()
        }
        
        
    }
}

struct cube_Previews: PreviewProvider {
    static var previews: some View {
        cubeView()
            .previewDevice("iPad (9th generation)")
            .previewInterfaceOrientation(.portrait)
        
    }
}

struct row: View {
    var Colors:[Color]
    var body: some View {
        HStack(spacing: 0){
            ZStack{
                Rectangle()
                    .foregroundColor(Colors[0])
                    .frame(width: 25, height: 25)
                Rectangle()
                    .stroke(.black, lineWidth: 3)
                    .frame(width: 25, height: 25)
            }
            ZStack{
                Rectangle()
                    .foregroundColor(Colors[1])
                    .frame(width: 25, height: 25)
                Rectangle()
                    .stroke(.black, lineWidth: 3)
                    .frame(width: 25, height: 25)
            }
            ZStack{
                Rectangle()
                    .foregroundColor(Colors[2])
                    .frame(width: 25, height: 25)
                Rectangle()
                    .stroke(.black, lineWidth: 3)
                    .frame(width: 25, height: 25)
            }
        }
    }
}

