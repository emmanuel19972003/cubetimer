//
//  preb7x7.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 5/13/22.
//

import SwiftUI

struct preb7x7: View {
    var size: Int
    let scramble:String
    let screenWidth = UIScreen.main.bounds.size.width
    var SQsize: CGFloat = 0.0
    @State var colorsk:Thecube7x7
    var BigSQ: CGFloat = 0.0
    var fotSize:Font = .largeTitle
    init(size:Int, scramble:String){
        self.size = size
        self.scramble = scramble
        SQsize = (self.screenWidth - 26.0)/(CGFloat(size) * 4 )
        colorsk = Thecube7x7(size: size)
        BigSQ = SQsize * CGFloat(size)
        if (size == 2 || size == 3 ){
            self.fotSize = .largeTitle
        }else if (size == 4  || size == 5){
            self.fotSize = .title
        }
        else if (size == 6 || size == 7){
            self.fotSize = .title3
        }
    }
    
    
    
    //static let screenSize = UIScreen.main.bounds.size
    var colors: [[Color]] = [[.green,.green,.green],[.green,.green,.green],[.green,.green,.green]]
    var body: some View {
        
        VStack {
            
            Spacer()
            HStack( spacing: 8){
                Spacer()
                VStack( spacing: 8){
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: BigSQ, height: BigSQ)
                    UnaCara(size: size, SQsize: SQsize, colross: colorsk.o)
                    Rectangle().foregroundColor(.clear)
                        .frame(width: BigSQ, height: BigSQ)
                    
                    
                    //Spacer()
                }
                
                VStack( spacing: 8){
                    UnaCara(size: size, SQsize: SQsize,colross: colorsk.w)
                    UnaCara(size: size, SQsize: SQsize,colross: colorsk.g)
                    UnaCara(size: size, SQsize: SQsize,colross: colorsk.y)
                    
                    //Spacer()
                }
                VStack( spacing: 8){
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: BigSQ, height: BigSQ)
                    UnaCara(size: size, SQsize: SQsize,colross: colorsk.r)
                    Rectangle().foregroundColor(.clear)
                        .frame(width: BigSQ, height: BigSQ)
                    //Spacer()
                }
                VStack( spacing: 8){
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: BigSQ, height: BigSQ)
                    UnaCara(size: size, SQsize: SQsize,colross: colorsk.b)
                    Rectangle().foregroundColor(.clear)
                        .frame(width: BigSQ, height: BigSQ)
                    
                    //Spacer()
                }

                

                Spacer()
            }
            Spacer()
            Text(scramble).font(fotSize).multilineTextAlignment(.center)
            Spacer()
        }.onAppear{
            colorsk.MakeScramble(scrambleToDo: scramble)
        }
        
        
                
    }
}


struct UnaCara: View {
    let size:Int
    let SQsize:CGFloat
    let colross:[[Color]]
    var lineW:CGFloat = 0
    init(size:Int, SQsize:CGFloat, colross:[[Color]]){
        self.size = size
        self.SQsize = SQsize
        self.colross = colross
        if (size == 2 || size == 3 ){
            self.lineW = 5
        }else if (size == 4  ){
            self.lineW = 4
        }
        else if (size == 6 || size == 5){
            self.lineW = 3
        }else if (size == 7 ){
            self.lineW = 2
        }
    }
    var body: some View {
        VStack( spacing: 0){
            ForEach(0..<size) {i in
                HStack( spacing: 0){
                    ForEach(0..<size) {j in
                        ZStack{
                            Rectangle()
                                .foregroundColor(colross[i][j])
                                .frame(width: SQsize, height: SQsize)
                            Rectangle()
                                .stroke(.black, lineWidth: lineW)
                                .frame(width: SQsize, height: SQsize)
                        }

                    }
                }
            }

        }
    }
}
        
        
        
struct preb7x7_Previews: PreviewProvider {
    static var previews: some View {
        preb7x7(size: 7, scramble: "R U ")
    }
}
