//
//  2x2Algs.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 4/17/22.
//

import SwiftUI

struct _x2Algs: View {
    @State var AlgTipe:String = "OLL"
    var body: some View {
        NavigationView{
            VStack {
                ZStack{
                    Rectangle().frame(width: .infinity, height: 65)
                        .cornerRadius(20)
                        .foregroundColor(Color("G&W"))
                        .padding(.horizontal, 7)
                    HStack{
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(AlgTipe == "OLL" ? Color(.link) : .clear)
                                .frame(width: 60, height: 40)
                            Text("OLL")
                        }.onTapGesture {
                            withAnimation(.spring()) {
                                AlgTipe = "OLL"
                            }
                            
                        }
                        
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(AlgTipe == "CLL" ? Color(.link) : .clear).frame(width: 60, height: 40)
                            Text("CLL")
                        }
                        .onTapGesture {
                            withAnimation() {
                                AlgTipe = "CLL"
                            }
                            
                        }
                        
                        Spacer()
                    }
                }.padding(.vertical)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .padding(.top,15)
                
                
                if (AlgTipe == "OLL"){
                    algoViwe(mv: ModeloFiltrado(datos: [
                        alginfo(nombre: "H", algo: "R2 U2 R U2 R2", imagen: "H2x2"),
                        alginfo(nombre: "Pi", algo: "R U2 R2 U' R2 U' R2 U2 R", imagen: "Pi"),
                        alginfo(nombre: "Antisune", algo: "R U2 R' U' R U' R'", imagen: "Antisune"),
                        alginfo(nombre: "Sune", algo: "R U R' U R U2 R'", imagen: "Sune"),
                        alginfo(nombre: "L  ", algo: "F R' F' R U R U' R'", imagen: "L"),
                        alginfo(nombre: "T", algo: "R U R' U' R' F R F'", imagen: "T2x2"),
                        alginfo(nombre: "U", algo: "F R U R' U' F'", imagen: "U")
                    ],llave: "OLL2X2"))
                    
                }else if (AlgTipe == "CLL"){
                    algoViwe(mv: ModeloFiltrado(datos: [
                        alginfo(nombre: "AS1", algo: "L' U' L U' L' U2 L", imagen: "AS1"),
                        alginfo(nombre: "AS2", algo: "L' U' L U L F' L' F L' U' L U' L' U2 L", imagen: "AS2"),
                        alginfo(nombre: "AS3", algo: "F' L F L' U2 L' U2 L", imagen: "AS3"),
                        alginfo(nombre: "AS4", algo: "R U2 R' U2 R' F R F'", imagen: "AS4"),
                        alginfo(nombre: "AS5", algo: "R' F R F' R U R'", imagen: "AS5"),
                        alginfo(nombre: "AS6", algo: "R' U R U' R2 F R F' R U R' U' R", imagen: "AS6"),
                        alginfo(nombre: "H1", algo: "R2 U2 R' U2 R2", imagen: "H1"),
                        alginfo(nombre: "H2", algo: "F R2 U' R2 U' R2 U R2 F'", imagen: "H2"),
                        alginfo(nombre: "H3", algo: "R U R' U R U L' U R' U' L", imagen: "H3"),
                        alginfo(nombre: "H4", algo: "x' U2 R U2 R2 F2 R U2 x", imagen: "H4"),
                        alginfo(nombre: "L1", algo: "R' U R' U2 R U' R' U R U' R2", imagen: "L1"),
                        alginfo(nombre: "L2", algo: "R U2 R2 F2 R U R' F2 R F'", imagen: "L2"),
                        alginfo(nombre: "L3", algo: "R U2 R' F' R U2 R' U R' F2 R", imagen: "L3"),
                        alginfo(nombre: "L4", algo: "F R' F' R U R U' R'", imagen: "L4"),
                        alginfo(nombre: "L5", algo: "F R U' R' U' R U R' F'", imagen: "L5"),
                        alginfo(nombre: "L6", algo: "R U2 R2 F R F' R U2 R'", imagen: "L6"),
                        alginfo(nombre: "Adjacent", algo: "R U R' U' R' F R2 U' R' U' R U R' F'", imagen: "Adjacent"),
                        alginfo(nombre: "Diagonal", algo: "F R U' R' U' R U R' F' R U R' U' R' F R F'", imagen: "Diagonal"),
                        alginfo(nombre: "P1", algo: "R U' R2 U R2 U R2 U' R", imagen: "P1"),
                        alginfo(nombre: "P2", algo: "R' F2 R F' U2 R U' R' U' F", imagen: "P2"),
                        alginfo(nombre: "P3", algo: "F R2 U' R2 U R2 U R2 F'", imagen: "P3"),
                        alginfo(nombre: "P4", algo: "R U2 R' U' R U R' U2 R' F R F'", imagen: "P4"),
                        alginfo(nombre: "P5", algo: "R U' R' F R' F R U R' F R", imagen: "P5"),
                        alginfo(nombre: "P6", algo: "R' U' R' F R F' R U' R' U2 R", imagen: "P6"),
                        alginfo(nombre: "S1", algo: "R U R' U R U2 R'", imagen: "S1"),
                        alginfo(nombre: "S2", algo: "L' U2 L U2 L F' L' F", imagen: "S2"),
                        alginfo(nombre: "S3", algo: "F R' F' R U2 R U2 R'", imagen: "S3"),
                        alginfo(nombre: "S4", algo: "R U R' U' R' F R F' R U R' U R U2 R'", imagen: "S4"),
                        alginfo(nombre: "S5", algo: "L F' L' F L' U' L", imagen: "S5"),
                        alginfo(nombre: "S6", algo: "R U R' U R' F R F' R U2 R'", imagen: "S6"),
                        alginfo(nombre: "T1", algo: "R' U R U2 R2 F' R U' R' F2 R2", imagen: "T1"),
                        alginfo(nombre: "T2", algo: "R' U R U2 R2 F R F' R", imagen: "T2"),
                        alginfo(nombre: "T3", algo: "L' U' L U L F' L' F", imagen: "T3"),
                        alginfo(nombre: "T4", algo: "F R U R' U' R U' R' U' R U R' F'", imagen: "T4"),
                        alginfo(nombre: "T5", algo: "R U R' U' R' F R F'", imagen: "T5"),
                        alginfo(nombre: "T6", algo: "F U' R U2 R' U' F2 R U R'", imagen: "T6"),
                        alginfo(nombre: "U1", algo: "R2 F2 R U R' F R2 U2 R' U' R", imagen: "U1"),
                        alginfo(nombre: "U2", algo: "R U2 R U' R' F R' F2 U' F", imagen: "U2"),
                        alginfo(nombre: "U3", algo: "R U2 R U' R' F R' F2 U' F", imagen: "U3"),
                        alginfo(nombre: "U4", algo: "F R' F' R U' R U' R' U2 R U' R'", imagen: "U4"),
                        alginfo(nombre: "U5", algo: "R U' R2 F R F' R U R' U' R U R'", imagen: "U5"),
                        alginfo(nombre: "U6", algo: "F R U R' U' F'", imagen: "U6")
                        
                    ],llave: "CLL"))
                }
                Spacer()
                
            }
        }.navigationViewStyle(.stack)
        
    }
}


struct _x2Algs_Previews: PreviewProvider {
    
    static var previews: some View {
        _x2Algs()
    }
}
