//
//  oll.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 4/3/22.
//

import SwiftUI

struct oll: View {
    @StateObject var mv = ModeloFiltradoOLL()
    @State var filtro:String = "Todos"
    var body: some View {
        VStack{
            HStack{
                Menu {
                    Button {
                        filtro = "Todos"
                        mv.listaPLLflitrada = mv.listaPLLccarga
                        
                    } label: {Text("Todos")}
                    Button {
                        filtro = "Aprendiendo"
                        mv.filtrado(valor: "Aprendiendo")
                        
                    } label: {Text("Aprendiendo")}
                    Button {
                        filtro = "Aprendido"
                        mv.filtrado(valor: "Aprendido")
                    } label: {Text("Aprendido")}
                    Button {
                        filtro = "Unmark"
                        mv.filtrado(valor: "normal")
                    } label: {Text("Unmark")}
                } label: {
                    HStack{
                        Spacer()
                        Image(systemName: "checklist")
                        Text(filtro)
                        Spacer()
                    }.frame(width: 200 )
                    
                }
            }.frame( maxWidth: .infinity)
                .padding(.horizontal)
            if (mv.listaPLLflitrada.isEmpty){
                //ContentListALg(alg: "swipleft to add elements", imag: "")
                Text("swipleft to add elements").font(.largeTitle)
                Spacer()
            }else {
                List{
                    ForEach(mv.listaPLLflitrada, id: \.id) { elalg in
                        ContentListALg(alg: elalg.algo, imag: elalg.imagen, colorBK: elalg.ElColorDeFondo())
                            .swipeActions(allowsFullSwipe: false) {
                                Button {
                                    mv.editarEstado(nombre: elalg.nombre, valor: "normal")
                                } label: {
                                    Label("Unmarck", systemImage: "x.circle")
                                }
                                .tint(Color(.systemGray4))
                                Button {
                                    mv.editarEstado(nombre: elalg.nombre, valor: "Aprendiendo")
                                    
                                } label: {
                                    
                                    Label("Aprendiendo", systemImage: "brain")
                                }
                                .tint(.orange)
                                
                                Button(role: .destructive) {
                                    mv.editarEstado(nombre: elalg.nombre, valor: "Aprendido")
                                   
                                } label: {
                                    Label("Aprendido", systemImage: "checkmark.circle")
                                }
                                .tint(.green)
                            }
                    }
                }.listStyle(.plain).padding(0)
            }
            
        }
        
    }
}

struct oll_Previews: PreviewProvider {
    static var previews: some View {
        oll()
    }
}
class ModeloFiltradoOLL: ObservableObject{
    @Published var listaPLLccarga:[alginfo] = []
    @Published var listaPLLflitrada:[alginfo] = []
    init (){
        getdata()
    }
    func getdata(){
        listaPLLccarga.append(contentsOf:
                                [
                                    alginfo(nombre: "29", algo: "R U R' U' R U' R' F' U' F R U R'", imagen: "29"),
                                    alginfo(nombre: "30", algo: "F R' F R2 U' R' U' R U R' F2", imagen: "30"),
                                    alginfo(nombre: "41", algo: "R U R' U R U2 R' F R U R' U' F'", imagen: "41"),
                                    alginfo(nombre: "42", algo: "R' U' R U' R' U2 R F R U R' U' F'", imagen: "42"),
                                    alginfo(nombre: "39", algo: "L F' L' U' L U F U' L'", imagen: "39"),
                                    alginfo(nombre: "40", algo: "R' F R U R' U' F' U R", imagen: "40"),
                                    alginfo(nombre: "34", algo: "R U R2 U' R' F R U R U' F'", imagen: "34"),
                                    alginfo(nombre: "46", algo: "R' U' R' F R F' U R", imagen: "46"),
                                    alginfo(nombre: "28", algo: "r U R' U' r' R U R U' R'", imagen: "28"),
                                    alginfo(nombre: "57", algo: "R U R' U' M' U R U' r'", imagen: "57"),
                                    alginfo(nombre: "21", algo: "R U2 R' U' R U R' U' R U' R'", imagen: "21"),
                                    alginfo(nombre: "22", algo: "R U2 R2 U' R2 U' R2 U2 R", imagen: "22"),
                                    alginfo(nombre: "23", algo: "R2 D' R U2 R' D R U2 R", imagen: "23"),
                                    alginfo(nombre: "24", algo: "r U R' U' r' F R F'", imagen: "24"),
                                    alginfo(nombre: "25", algo: "F' r U R' U' r' F R", imagen: "25"),
                                    alginfo(nombre: "26", algo: "R U2 R' U' R U' R'", imagen: "26"),
                                    alginfo(nombre: "27", algo: "R U R' U R U2 R'", imagen: "27"),
                                    alginfo(nombre: "1", algo: "R U2 R2 F R F' U2 R' F R F'", imagen: "1"),
                                    alginfo(nombre: "2", algo: "r U r' U2 r U2 R' U2 R U' r'", imagen: "2"),
                                    alginfo(nombre: "3", algo: "r' R2 U R' U r U2 r' U M'", imagen: "3"),
                                    alginfo(nombre: "4", algo: "M U' r U2 r' U' R U' R' M'", imagen: "4"),
                                    alginfo(nombre: "17", algo: "F R' F' R2 r' U R U' R' U' M'", imagen: "17"),
                                    alginfo(nombre: "18", algo: "r U R' U R U2 r2 U' R U' R' U2 r", imagen: "18"),
                                    alginfo(nombre: "19", algo: "r' R U R U R' U' M' R' F R F'", imagen: "19"),
                                    alginfo(nombre: "20", algo: "r U R' U' M2 U R U' R' U' M'", imagen: "20"),
                                    alginfo(nombre: "9", algo: "R U R' U' R' F R2 U R' U' F'", imagen: "9"),
                                    alginfo(nombre: "10", algo: "R U R' U R' F R F' R U2 R'", imagen: "10"),
                                    alginfo(nombre: "35", algo: "R U2 R2 F R F' R U2 R'", imagen: "35"),
                                    alginfo(nombre: "37", algo: "F R' F' R U R U' R'", imagen: "37"),
                                    alginfo(nombre: "51", algo: "F U R U' R' U R U' R' F'", imagen: "51"),
                                    alginfo(nombre: "52", algo: "R U R' U R U' B U' B' R'", imagen: "52"),
                                    alginfo(nombre: "55", algo: "R' F R U R U' R2 F' R2 U' R' U R U R'", imagen: "55"),
                                    alginfo(nombre: "56", algo: "r' U' r U' R' U R U' R' U R r' U r", imagen: "56"),
                                    alginfo(nombre: "13", algo: "F U R U' R2 F' R U R U' R'", imagen: "13"),
                                    alginfo(nombre: "14", algo: "R' F R U R' F' R F U' F'", imagen: "14"),
                                    alginfo(nombre: "15", algo: "l' U' l L' U' L U l' U l", imagen: "15"),
                                    alginfo(nombre: "16", algo: "r U r' R U R' U' r U' r'", imagen: "16"),
                                    alginfo(nombre: "31", algo: "R' U' F U R U' R' F' R", imagen: "31"),
                                    alginfo(nombre: "32", algo: "L U F' U' L' U L F L'", imagen: "32"),
                                    alginfo(nombre: "43", algo: "F' U' L' U L F", imagen: "43"),
                                    alginfo(nombre: "44", algo: "F U R U' R' F'", imagen: "44"),
                                    alginfo(nombre: "47", algo: "R' U' R' F R F' R' F R F' U R", imagen: "47"),
                                    alginfo(nombre: "48", algo: "F R U R' U' R U R' U' F'", imagen: "48"),
                                    alginfo(nombre: "49", algo: "r U' r2 U r2 U r2 U' r", imagen: "49"),
                                    alginfo(nombre: "50", algo: "r' U r2 U' r2 U' r2 U r'", imagen: "50"),
                                    alginfo(nombre: "53", algo: "l' U2 L U L' U' L U L' U l", imagen: "53"),
                                    alginfo(nombre: "54", algo: "r U2 R' U' R U R' U' R U' r'", imagen: "54"),
                                    alginfo(nombre: "7", algo: "r U R' U R U2 r'", imagen: "7"),
                                    alginfo(nombre: "8", algo: "l' U' L U' L' U2 l", imagen: "8"),
                                    alginfo(nombre: "11", algo: "r U R' U R' F R F' R U2 r'", imagen: "11"),
                                    alginfo(nombre: "12", algo: "M' R' U' R U' R' U2 R U' R r'", imagen: "12"),
                                    alginfo(nombre: "5", algo: "l' U2 L U L' U l", imagen: "5"),
                                    alginfo(nombre: "6", algo: "r U2 R' U' R U' r'", imagen: "6"),
                                    alginfo(nombre: "33", algo: "R U R' U' R' F R F'", imagen: "33"),
                                    alginfo(nombre: "45", algo: "F R U R' U' F'", imagen: "45"),
                                    alginfo(nombre: "36", algo: "L' U' L U' L' U L U L F' L' F", imagen: "36"),
                                    alginfo(nombre: "38", algo: "R U R' U R U' R' U' R' F R F'", imagen: "38")
                                ]
                              
        )
        guard
            let data = UserDefaults.standard.data(forKey: "OLL"),
            let otracosa = try? JSONDecoder().decode([alginfo].self, from: data)
        else {return}
        
        listaPLLccarga = otracosa
        listaPLLflitrada = listaPLLccarga
    }
    func filtrado(valor:String){
        self.listaPLLflitrada = listaPLLccarga.filter({ alginfo in
            alginfo.Stado == valor
        })
        
    }
    func editarEstado(nombre:String, valor:String){
        for k in 0...listaPLLflitrada.count - 1{
            if (listaPLLflitrada[k].nombre == nombre){
                listaPLLflitrada[k].Stado = valor
                listaPLLccarga[k].Stado = valor
            }
        }
        for k in 0...listaPLLccarga.count - 1{
            if (listaPLLccarga[k].nombre == nombre){
                listaPLLccarga[k].Stado = valor
                
            }
        }
        saveData()
    }
    func saveData(){
        if let codeData = try? JSONEncoder().encode(listaPLLccarga){
            UserDefaults.standard.set(codeData, forKey: "OLL")
        }
    }
}
/*
 [
     alginfo(nombre: "29", algo: "R U R' U' R U' R' F' U' F R U R'", imagen: "29"),
     alginfo(nombre: "30", algo: "F R' F R2 U' R' U' R U R' F2", imagen: "30"),
     alginfo(nombre: "41", algo: "R U R' U R U2 R' F R U R' U' F'", imagen: "41"),
     alginfo(nombre: "42", algo: "R' U' R U' R' U2 R F R U R' U' F'", imagen: "42"),
     alginfo(nombre: "39", algo: "L F' L' U' L U F U' L'", imagen: "39"),
     alginfo(nombre: "40", algo: "R' F R U R' U' F' U R", imagen: "40"),
     alginfo(nombre: "34", algo: "R U R2 U' R' F R U R U' F'", imagen: "34"),
     alginfo(nombre: "46", algo: "R' U' R' F R F' U R", imagen: "46"),
     alginfo(nombre: "28", algo: "r U R' U' r' R U R U' R'", imagen: "28"),
     alginfo(nombre: "57", algo: "R U R' U' M' U R U' r'", imagen: "57"),
     alginfo(nombre: "21", algo: "R U2 R' U' R U R' U' R U' R'", imagen: "21"),
     alginfo(nombre: "22", algo: "R U2 R2 U' R2 U' R2 U2 R", imagen: "22"),
     alginfo(nombre: "23", algo: "R2 D' R U2 R' D R U2 R", imagen: "23"),
     alginfo(nombre: "24", algo: "r U R' U' r' F R F'", imagen: "24"),
     alginfo(nombre: "25", algo: "F' r U R' U' r' F R", imagen: "25"),
     alginfo(nombre: "26", algo: "R U2 R' U' R U' R'", imagen: "26"),
     alginfo(nombre: "27", algo: "R U R' U R U2 R'", imagen: "27"),
     alginfo(nombre: "1", algo: "R U2 R2 F R F' U2 R' F R F'", imagen: "1"),
     alginfo(nombre: "2", algo: "r U r' U2 r U2 R' U2 R U' r'", imagen: "2"),
     alginfo(nombre: "3", algo: "r' R2 U R' U r U2 r' U M'", imagen: "3"),
     alginfo(nombre: "4", algo: "M U' r U2 r' U' R U' R' M'", imagen: "4"),
     alginfo(nombre: "17", algo: "F R' F' R2 r' U R U' R' U' M'", imagen: "17"),
     alginfo(nombre: "18", algo: "r U R' U R U2 r2 U' R U' R' U2 r", imagen: "18"),
     alginfo(nombre: "19", algo: "r' R U R U R' U' M' R' F R F'", imagen: "19"),
     alginfo(nombre: "20", algo: "r U R' U' M2 U R U' R' U' M'", imagen: "20"),
     alginfo(nombre: "9", algo: "R U R' U' R' F R2 U R' U' F'", imagen: "9"),
     alginfo(nombre: "10", algo: "R U R' U R' F R F' R U2 R'", imagen: "10"),
     alginfo(nombre: "35", algo: "R U2 R2 F R F' R U2 R'", imagen: "35"),
     alginfo(nombre: "37", algo: "F R' F' R U R U' R'", imagen: "37"),
     alginfo(nombre: "51", algo: "F U R U' R' U R U' R' F'", imagen: "51"),
     alginfo(nombre: "52", algo: "R U R' U R U' B U' B' R'", imagen: "52"),
     alginfo(nombre: "55", algo: "R' F R U R U' R2 F' R2 U' R' U R U R'", imagen: "55"),
     alginfo(nombre: "56", algo: "r' U' r U' R' U R U' R' U R r' U r", imagen: "56"),
     alginfo(nombre: "13", algo: "F U R U' R2 F' R U R U' R'", imagen: "13"),
     alginfo(nombre: "14", algo: "R' F R U R' F' R F U' F'", imagen: "14"),
     alginfo(nombre: "15", algo: "l' U' l L' U' L U l' U l", imagen: "15"),
     alginfo(nombre: "16", algo: "r U r' R U R' U' r U' r'", imagen: "16"),
     alginfo(nombre: "31", algo: "R' U' F U R U' R' F' R", imagen: "31"),
     alginfo(nombre: "32", algo: "L U F' U' L' U L F L'", imagen: "32"),
     alginfo(nombre: "43", algo: "F' U' L' U L F", imagen: "43"),
     alginfo(nombre: "44", algo: "F U R U' R' F'", imagen: "44"),
     alginfo(nombre: "47", algo: "R' U' R' F R F' R' F R F' U R", imagen: "47"),
     alginfo(nombre: "48", algo: "F R U R' U' R U R' U' F'", imagen: "48"),
     alginfo(nombre: "49", algo: "r U' r2 U r2 U r2 U' r", imagen: "49"),
     alginfo(nombre: "50", algo: "r' U r2 U' r2 U' r2 U r'", imagen: "50"),
     alginfo(nombre: "53", algo: "l' U2 L U L' U' L U L' U l", imagen: "53"),
     alginfo(nombre: "54", algo: "r U2 R' U' R U R' U' R U' r'", imagen: "54"),
     alginfo(nombre: "7", algo: "r U R' U R U2 r'", imagen: "7"),
     alginfo(nombre: "8", algo: "l' U' L U' L' U2 l", imagen: "8"),
     alginfo(nombre: "11", algo: "r U R' U R' F R F' R U2 r'", imagen: "11"),
     alginfo(nombre: "12", algo: "M' R' U' R U' R' U2 R U' R r'", imagen: "12"),
     alginfo(nombre: "5", algo: "l' U2 L U L' U l", imagen: "5"),
     alginfo(nombre: "6", algo: "r U2 R' U' R U' r'", imagen: "6"),
     alginfo(nombre: "33", algo: "R U R' U' R' F R F'", imagen: "33"),
     alginfo(nombre: "45", algo: "F R U R' U' F'", imagen: "45"),
     alginfo(nombre: "36", algo: "L' U' L U' L' U L U L F' L' F", imagen: "36"),
     alginfo(nombre: "38", algo: "R U R' U R U' R' U' R' F R F'", imagen: "38")
 ]
 */
