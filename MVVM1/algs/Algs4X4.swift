//
//  Algs4X4.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 4/17/22.
//

import SwiftUI

struct Algs4X4: View {
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
                            RoundedRectangle(cornerRadius: 10).foregroundColor(AlgTipe == "PLL" ? Color(.link) : .clear).frame(width: 60, height: 40)
                            Text("PLL")
                        }
                        .onTapGesture {
                            withAnimation() {
                                AlgTipe = "PLL"
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
                        alginfo(nombre: "Parity", algo: "Rw U2 x Rw U2 Rw U2 Rw' U2 Lw U2 Rw' U2 Rw U2 Rw' U2 Rw'", imagen: "ParityOLL"),
                        alginfo(nombre: "H (FB)", algo: "(Parity) R2 D' R U2 R' D R U2 R", imagen: "H (FB)"),
                        alginfo(nombre: "H (LR)", algo: "(Parity) R U R' U R U' R' U R U2 R'", imagen: "H (LR)"),
                        alginfo(nombre: "Pi (B)", algo: "(Parity) U' 3Rw U R' U' 3Rw' F R F'", imagen: "Pi (B)"),
                        alginfo(nombre: "Pi (F)", algo: "(Parity) U' R U2 R2 U' R2 U' R2 U2 R", imagen: "Pi (F)"),
                        alginfo(nombre: "Pi (L)", algo: "(Parity) R' U2 R U R' U R", imagen: "Pi (L)"),
                        alginfo(nombre: "Pi (R)", algo: "(Parity) U R' U' R U' R' U2 R", imagen: "Pi (R)"),
                        alginfo(nombre: "Antisune (BL)", algo: "R' F R F' (Parity) R U' R'", imagen: "Antisune (BL)"),
                        alginfo(nombre: "Antisune (BR)", algo: "F R U R' U' F'  (Parity)", imagen: "Antisune (BR)"),
                        alginfo(nombre: "Antisune (FL)", algo: "(Parity) R U2 R2 U' R2 U' R2 U2 R", imagen: "Antisune (FL)"),
                        alginfo(nombre: "Antisune (FR)", algo: "(Parity) U' R U2 R' U' R U' R'", imagen: "Antisune (FR)"),
                        alginfo(nombre: "Sune (BL)", algo: "F' L' U' L U F (Parity)", imagen: "Sune (BL)"),
                        alginfo(nombre: "Sune (BR)", algo: "L F' L' F (Parity) L' U L", imagen: "Sune (BR)"),
                        alginfo(nombre: "Sune (FL)", algo: "(Parity) R U R' U R U2 R'", imagen: "Sune (FL)"),
                        alginfo(nombre: "Sune (FR)", algo: "M' U R U' 3Rw' (Parity) U R U2 R'", imagen: "Sune (FR)"),
                        alginfo(nombre: "L (BL)", algo: "(Parity) R' U' R U' R' U2 R", imagen: "L (BL)"),
                        alginfo(nombre: "L (BR)", algo: "(Parity) U R' U2 R U R' U R", imagen: "L (BR)"),
                        alginfo(nombre: "L (FL)", algo: "L U L' (Parity) L U' L'", imagen: "L (FL)"),
                        alginfo(nombre: "L (FR)", algo: "R' U' R (Parity) R' U R", imagen: "L (FR)"),
                        alginfo(nombre: "T (B)", algo: "(Parity) U R U2 R2 U' R2 U' R2 U2 R", imagen: "T (B)"),
                        alginfo(nombre: "T (F)", algo: "R U R' U' R (Parity) R' U R U' R'", imagen: "T (F)"),
                        alginfo(nombre: "T (L)", algo: "F R U' R' U' R U R' F' (Parity)", imagen: "T (L)"),
                        alginfo(nombre: "T (R)", algo: "(Parity) R U R' U' R' F R F'", imagen: "T (R)"),
                        alginfo(nombre: "U (B)", algo: "M (Parity) M'", imagen: "U (B)"),
                        alginfo(nombre: "U (L)", algo: "(Parity) R U2 R' U' R U' R'", imagen: "U (L)"),
                        alginfo(nombre: "U (R)", algo: "(Parity) U' R U R' U R U2 R'", imagen: "U (R)"),
                        alginfo(nombre: "Solved", algo: "R U2 R' U' (Parity) F R' F' R", imagen: "Solved")
                        
                    ],llave: "OLL4X4"))
                    
                }else if (AlgTipe == "PLL"){
                    algoViwe(mv: ModeloFiltrado(datos: [
                        alginfo(nombre: "Parity", algo: "2R2 U2 2R2 Uw2 2R2 Uw2", imagen: "Parity"),
                        alginfo(nombre: "Adj-C", algo: "R U R' U' R' F R2 U' R' U' R U R' F' U' (Parity)", imagen: "Adj-C"),
                        alginfo(nombre: "Ba", algo: "(Parity) U R U R' F' R U R' U' R' F R2 U' R'", imagen: "Ba"),
                        alginfo(nombre: "Bb", algo: "R U R' U' R' F R2 U' R' (Parity) U R U R' F'", imagen: "Bb"),
                        alginfo(nombre: "Ca", algo: "(Parity) U R' U2 R U2 R' F R U R' U' R' F' R2", imagen: "Ca"),
                        alginfo(nombre: "Cb", algo: "(Parity) R U R' F' R U2 R' U2 R' F R U R U2 R'", imagen: "Cb"),
                        alginfo(nombre: "Da", algo: "R' U L' U2 R U' R' U2 R L U' (Parity)", imagen: "Da"),
                        alginfo(nombre: "Db", algo: "R U R' F' R U R' U' R' F R2 U' R' (Parity)", imagen: "Db"),
                        alginfo(nombre: "Ka", algo: "(Parity) x R2 D2 R U R' D2 R U' R", imagen: "Ka"),
                        alginfo(nombre: "Kb", algo: "(Parity) U x R' U R' D2 R U' R' D2 R2", imagen: "Kb"),
                        alginfo(nombre: "M", algo: "R U R' U' R' F R2 U' R' U' R U R' F' (Parity)", imagen: "M"),
                        alginfo(nombre: "Pa", algo: "R U R' F' R U R' U' R' F R2 U' R' U' (Parity)", imagen: "Pa"),
                        alginfo(nombre: "Pb", algo: "(Parity) R U R' F' R U R' U' R' F R2 U' R'", imagen: "Pb"),
                        alginfo(nombre: "Diag-C", algo: "F R U' R' U' R U R' F' U' (Parity) U' R U R' U' R' F R F'", imagen: "Diag-C"),
                        alginfo(nombre: "Q", algo: "x' R U' R' D R U R' D' R U R' D R U' R' D' x U (Parity)", imagen: "Q"),
                        alginfo(nombre: "Sa", algo: "F R U' R' U' R U R' F' R U R' U' R' F R F' U' (Parity)", imagen: "Sa"),
                        alginfo(nombre: "Sb", algo: "F R U' R' U' R U R' F' R U R' U' R' F R F' (Parity)", imagen: "Sb"),
                        alginfo(nombre: "X", algo: "x' R U' R' D R U R' D' R U R' D R U' R' D' x (Parity)", imagen: "X"),
                        alginfo(nombre: "Adj-E", algo: "R U R' U' (Parity) U' R U' R'", imagen: "Adj-E"),
                        alginfo(nombre: "O+", algo: "M' U' M2 U' M2 U' M' U2 M2 (Parity)", imagen: "O+"),
                        alginfo(nombre: "O-", algo: "M' U' M2 U' M2 U' M' U2 M2 U' (Parity)", imagen: "O-"),
                        alginfo(nombre: "W", algo: "R U' R U R U R U' R' U' R2 (Parity)", imagen: "W")
                        
                        ],llave: "PLL4X4"))
                }
                Spacer()
                
            }
        }.navigationViewStyle(.stack)
        
    }
}

struct Algs4X4_Previews: PreviewProvider {
    static var previews: some View {
        Algs4X4()
    }
}
