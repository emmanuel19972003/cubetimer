//
//  listaAlgs.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 4/3/22.
//

import SwiftUI

struct listaAlgs: View {
    @State var AlgTipe:String = "PLL"
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
                            RoundedRectangle(cornerRadius: 10).foregroundColor(AlgTipe == "2L-PLL" ? Color(.link) : .clear)
                                .frame(width: 60, height: 40)
                            Text("2L-PLL")
                        }.onTapGesture {
                            withAnimation(.spring()) {
                                AlgTipe = "2L-PLL"
                            }
                            
                        }
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(AlgTipe == "2L-OLL" ? Color(.link) : .clear)
                                .frame(width: 60, height: 40)
                            Text("2L-OLL")
                        }.onTapGesture {
                            withAnimation(.spring()) {
                                AlgTipe = "2L-OLL"
                            }
                            
                        }
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(AlgTipe == "PLL" ? Color(.link) : .clear)
                                .frame(width: 60, height: 40)
                            Text("PLL")
                        }.onTapGesture {
                            withAnimation(.spring()) {
                                AlgTipe = "PLL"
                            }
                            
                        }
                        
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(AlgTipe == "OLL" ? Color(.link) : .clear).frame(width: 60, height: 40)
                            Text("OLL")
                        }
                        .onTapGesture {
                            withAnimation() {
                                AlgTipe = "OLL"
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
                        alginfo(nombre: "1", algo: "R U2 R2 F R F' U2 R' F R F'", imagen: "1"),
                        alginfo(nombre: "2", algo: "r U r' U2 r U2 R' U2 R U' r'", imagen: "2"),
                        alginfo(nombre: "3", algo: "r' R2 U R' U r U2 r' U M'", imagen: "3"),
                        alginfo(nombre: "4", algo: "M U' r U2 r' U' R U' R' M'", imagen: "4"),
                        alginfo(nombre: "5", algo: "l' U2 L U L' U l", imagen: "5"),
                        alginfo(nombre: "6", algo: "r U2 R' U' R U' r'", imagen: "6"),
                        alginfo(nombre: "7", algo: "r U R' U R U2 r'", imagen: "7"),
                        alginfo(nombre: "8", algo: "l' U' L U' L' U2 l", imagen: "8"),
                        alginfo(nombre: "9", algo: "R U R' U' R' F R2 U R' U' F'", imagen: "9"),
                        alginfo(nombre: "10", algo: "R U R' U R' F R F' R U2 R'", imagen: "10"),
                        alginfo(nombre: "11", algo: "r U R' U R' F R F' R U2 r'", imagen: "11"),
                        alginfo(nombre: "12", algo: "M' R' U' R U' R' U2 R U' R r'", imagen: "12"),
                        alginfo(nombre: "13", algo: "F U R U' R2 F' R U R U' R'", imagen: "13"),
                        alginfo(nombre: "14", algo: "R' F R U R' F' R F U' F'", imagen: "14"),
                        alginfo(nombre: "15", algo: "l' U' l L' U' L U l' U l", imagen: "15"),
                        alginfo(nombre: "16", algo: "r U r' R U R' U' r U' r'", imagen: "16"),
                        alginfo(nombre: "17", algo: "F R' F' R2 r' U R U' R' U' M'", imagen: "17"),
                        alginfo(nombre: "18", algo: "r U R' U R U2 r2 U' R U' R' U2 r", imagen: "18"),
                        alginfo(nombre: "19", algo: "r' R U R U R' U' M' R' F R F'", imagen: "19"),
                        alginfo(nombre: "20", algo: "r U R' U' M2 U R U' R' U' M'", imagen: "20"),
                        alginfo(nombre: "21", algo: "R U2 R' U' R U R' U' R U' R'", imagen: "21"),
                        alginfo(nombre: "22", algo: "R U2 R2 U' R2 U' R2 U2 R", imagen: "22"),
                        alginfo(nombre: "23", algo: "R2 D' R U2 R' D R U2 R", imagen: "23"),
                        alginfo(nombre: "24", algo: "r U R' U' r' F R F'", imagen: "24"),
                        alginfo(nombre: "25", algo: "F' r U R' U' r' F R", imagen: "25"),
                        alginfo(nombre: "26", algo: "R U2 R' U' R U' R'", imagen: "26"),
                        alginfo(nombre: "27", algo: "R U R' U R U2 R'", imagen: "27"),
                        alginfo(nombre: "28", algo: "r U R' U' r' R U R U' R'", imagen: "28"),
                        alginfo(nombre: "29", algo: "R U R' U' R U' R' F' U' F R U R'", imagen: "29"),
                        alginfo(nombre: "30", algo: "F R' F R2 U' R' U' R U R' F2", imagen: "30"),
                        alginfo(nombre: "31", algo: "R' U' F U R U' R' F' R", imagen: "31"),
                        alginfo(nombre: "32", algo: "L U F' U' L' U L F L'", imagen: "32"),
                        alginfo(nombre: "33", algo: "R U R' U' R' F R F'", imagen: "33"),
                        alginfo(nombre: "34", algo: "R U R2 U' R' F R U R U' F'", imagen: "34"),
                        alginfo(nombre: "35", algo: "R U2 R2 F R F' R U2 R'", imagen: "35"),
                        alginfo(nombre: "36", algo: "L' U' L U' L' U L U L F' L' F", imagen: "36"),
                        alginfo(nombre: "37", algo: "F R' F' R U R U' R'", imagen: "37"),
                        alginfo(nombre: "38", algo: "R U R' U R U' R' U' R' F R F'", imagen: "38"),
                        alginfo(nombre: "39", algo: "L F' L' U' L U F U' L'", imagen: "39"),
                        alginfo(nombre: "40", algo: "R' F R U R' U' F' U R", imagen: "40"),
                        alginfo(nombre: "41", algo: "R U R' U R U2 R' F R U R' U' F'", imagen: "41"),
                        alginfo(nombre: "42", algo: "R' U' R U' R' U2 R F R U R' U' F'", imagen: "42"),
                        alginfo(nombre: "43", algo: "F' U' L' U L F", imagen: "43"),
                        alginfo(nombre: "44", algo: "F U R U' R' F'", imagen: "44"),
                        alginfo(nombre: "45", algo: "F R U R' U' F'", imagen: "45"),
                        alginfo(nombre: "46", algo: "R' U' R' F R F' U R", imagen: "46"),
                        alginfo(nombre: "47", algo: "R' U' R' F R F' R' F R F' U R", imagen: "47"),
                        alginfo(nombre: "48", algo: "F R U R' U' R U R' U' F'", imagen: "48"),
                        alginfo(nombre: "49", algo: "r U' r2 U r2 U r2 U' r", imagen: "49"),
                        alginfo(nombre: "51", algo: "F U R U' R' U R U' R' F'", imagen: "51"),
                        alginfo(nombre: "52", algo: "R U R' U R U' B U' B' R'", imagen: "52"),
                        alginfo(nombre: "50", algo: "r' U r2 U' r2 U' r2 U r'", imagen: "50"),
                        alginfo(nombre: "53", algo: "l' U2 L U L' U' L U L' U l", imagen: "53"),
                        alginfo(nombre: "54", algo: "r U2 R' U' R U R' U' R U' r'", imagen: "54"),
                        alginfo(nombre: "55", algo: "R' F R U R U' R2 F' R2 U' R' U R U R'", imagen: "55"),
                        alginfo(nombre: "56", algo: "r' U' r U' R' U R U' R' U R r' U r", imagen: "56"),
                        alginfo(nombre: "57", algo: "R U R' U' M' U R U' r'", imagen: "57")
                        
                    ],llave: "OLL"))
                }else if (AlgTipe == "PLL"){
                    algoViwe(mv: ModeloFiltrado(datos: [
                        alginfo(nombre: "AA", algo: "x L2 D2 L' U' L D2 L' U L'", imagen: "AA"),
                        alginfo(nombre: "AB", algo: "x' L2 D2 L U L' D2 L U' L", imagen: "AB"),
                        alginfo(nombre: "F", algo: "R' U' F' R U R' U' R' F R2 U' R' U' R U R' U R", imagen: "F"),
                        alginfo(nombre: "GA", algo: "R2 U R' U R' U' R U' R2 U' D R' U R D'", imagen: "GA"),
                        alginfo(nombre: "GB", algo: "R' U' R U D' R2 U R' U R U' R U' R2 D", imagen: "GB"),
                        alginfo(nombre: "GC", algo: "R2 U' R U' R U R' U R2 U D' R U' R' D", imagen: "GC"),
                        alginfo(nombre: "GD", algo: "R U R' U' D R2 U' R U' R' U R' U R2 D'", imagen: "GD"),
                        alginfo(nombre: "JA", algo: "x R2 F R F' R U2 r' U r U2", imagen: "JA"),
                        alginfo(nombre: "JB", algo: "R U' R' U' R U R D R' U' R D' R' U2 R'", imagen: "JB"),
                        alginfo(nombre: "RA", algo: "R U' R' U' R U R D R' U' R D' R' U2 R'", imagen: "RA"),
                        alginfo(nombre: "RB", algo: "R2 F R U R U' R' F' R U2 R' U2 R", imagen: "RB"),
                        alginfo(nombre: "T", algo: "R U R' U' R' F R2 U' R' U' R U R' F'", imagen: "T"),
                        alginfo(nombre: "E", algo: "x' L' U L D' L' U' L D L' U' L D' L' U L D", imagen: "E"),
                        alginfo(nombre: "NA", algo: "R U R' U R U R' F' R U R' U' R' F R2 U' R' U2 R U' R'", imagen: "NA"),
                        alginfo(nombre: "NB", algo: "R' U R U' R' F' U' F R U R' F R' F' R U' R", imagen: "NB"),
                        alginfo(nombre: "V", algo: "R' U R' U' y R' F' R2 U' R' U R' F R F", imagen: "V"),
                        alginfo(nombre: "Y", algo: "F R U' R' U' R U R' F' R U R' U' R' F R F'", imagen: "Y"),
                        alginfo(nombre: "H", algo: "M2 U M2 U2 M2 U M2", imagen: "H"),
                        alginfo(nombre: "UA", algo: "M2 U M U2 M' U M2", imagen: "UA"),
                        alginfo(nombre: "UB", algo: "M2 U' M U2 M' U' M2", imagen: "UB"),
                        alginfo(nombre: "Z", algo: "M' U M2 U M2 U M' U2 M2", imagen: "Z")
                    ],llave: "PLL"))
                }else if (AlgTipe == "2L-PLL"){
                    algoViwe(mv: ModeloFiltrado(datos: [
                        alginfo(nombre: "AA", algo: "x L2 D2 L' U' L D2 L' U L'", imagen: "AA"),
                        alginfo(nombre: "AB", algo: "x' L2 D2 L U L' D2 L U' L", imagen: "AB"),
                        alginfo(nombre: "H", algo: "M2 U M2 U2 M2 U M2", imagen: "H"),
                        alginfo(nombre: "UA", algo: "M2 U M U2 M' U M2", imagen: "UA"),
                        alginfo(nombre: "UB", algo: "M2 U' M U2 M' U' M2", imagen: "UB"),
                        alginfo(nombre: "Z", algo: "M' U M2 U M2 U M' U2 M2", imagen: "Z")
                    ],llave: "2L-PLL"))
                }else if (AlgTipe == "2L-OLL"){
                    algoViwe(mv: ModeloFiltrado(datos: [
                        //2LO1
                        alginfo(nombre: "2LO1", algo: "F R U R' U' F' f R U R' U' f'", imagen: "2LO1"),
                        alginfo(nombre: "2LO2", algo: "F R U R' U' F'", imagen: "2LO1"),
                        alginfo(nombre: "21", algo: "R U2 R' U' R U R' U' R U' R'", imagen: "21"),
                        alginfo(nombre: "22", algo: "R U2 R2 U' R2 U' R2 U2 R", imagen: "22"),
                        alginfo(nombre: "23", algo: "R2 D' R U2 R' D R U2 R", imagen: "23"),
                        alginfo(nombre: "24", algo: "r U R' U' r' F R F'", imagen: "24"),
                        alginfo(nombre: "25", algo: "F' r U R' U' r' F R", imagen: "25"),
                        alginfo(nombre: "26", algo: "R U2 R' U' R U' R'", imagen: "26"),
                        alginfo(nombre: "27", algo: "R U R' U R U2 R'", imagen: "27")
                        
                    ],llave: "2L-OLL"))
                }

                Spacer()
                
            }
        }.navigationViewStyle(.stack)
        
    }
}

struct listaAlgs_Previews: PreviewProvider {
    static var previews: some View {
        listaAlgs()
    }
}
