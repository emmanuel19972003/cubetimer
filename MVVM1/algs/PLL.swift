//
//  PLL.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 4/3/22.
//

import SwiftUI

struct algoViwe: View {
    @StateObject var mv:ModeloFiltrado
    @State var filtro:String = "All"
    var body: some View {
        VStack{
            HStack{
                Menu {
                    Button {
                        filtro = "All"
                        mv.listaPLLflitrada = mv.listaPLLccarga
                        
                    } label: {Text("All")}
                    Button {
                        filtro = "Learning"
                        mv.filtrado(valor: "Aprendiendo")
                        
                    } label: {Text("Learning")}
                    Button {
                        filtro = "Learned"
                        mv.filtrado(valor: "Aprendido")
                    } label: {Text("Learned")}
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
                                    Label("Unmark", systemImage: "x.circle")
                                }
                                .tint(Color(.systemGray4))
                                Button {
                                    mv.editarEstado(nombre: elalg.nombre, valor: "Aprendiendo")
                                    
                                } label: {
                                    
                                    Label("Learning", systemImage: "brain")
                                }
                                .tint(.orange)
                                
                                Button(role: .destructive) {
                                    mv.editarEstado(nombre: elalg.nombre, valor: "Aprendido")
                                   
                                } label: {
                                    Label("Learned", systemImage: "checkmark.circle")
                                }
                                .tint(.green)
                            }
                    }
                }.listStyle(.plain).padding(0)
            }
            
        }
        
    }
}


struct alginfo: Identifiable, Codable {
    var id = UUID().uuidString
    let nombre:String
    let algo:String
    let imagen:String
    var Stado:String = "normal"
    func ElColorDeFondo() -> Color{
        var backColor: Color = Color(.systemGray4)
        if (self.Stado == "Aprendido"){
            backColor = .green
        }else if (self.Stado == "Aprendiendo"){
            backColor = .orange
        }
        return backColor
        
    }
}

struct ContentListALg: View {
    let alg: String
    let imag: String
    var colorBK: Color = Color(.systemGray4)
    var body: some View {
        RoundedRectangle(cornerRadius: 15).foregroundColor(colorBK).padding(0).frame(height: 110).overlay(
            HStack{
                Image(imag).resizable().aspectRatio(contentMode: .fit)
                Spacer().frame(width: 10)
                VStack(alignment: .leading){
                    Text(imag).font(.title)
                    Text(alg)
                    
                    
                }.padding()
                Spacer()
            }
            
        )
    }
}

class ModeloFiltrado: ObservableObject{
    @Published var listaPLLccarga:[alginfo]
    @Published var listaPLLflitrada:[alginfo] = []
    let llave:String
    init (datos:[alginfo], llave:String){
        self.llave = llave
        self.listaPLLccarga = datos
        getdata()
    }
    func getdata(){
        listaPLLflitrada = listaPLLccarga
        guard
            let data = UserDefaults.standard.data(forKey: llave),
            let otracosa = try? JSONDecoder().decode([alginfo].self, from: data)
        else {return}
        
        listaPLLccarga = otracosa
        listaPLLflitrada = listaPLLccarga
        
//        listaPLLflitrada = listaPLLccarga
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
                //listaPLLccarga[k].Stado = valor
            }
        }
        //listaPLLflitrada.first(where: $0.nombre == nombre)
        for k in 0...listaPLLccarga.count - 1{
            if (listaPLLccarga[k].nombre == nombre){
                listaPLLccarga[k].Stado = valor
                //listaPLLccarga[k].Stado = valor
            }
        }
        saveData()
    }
    func saveData(){
        if let codeData = try? JSONEncoder().encode(listaPLLccarga){
            UserDefaults.standard.set(codeData, forKey: llave)
        }
    }
}

struct PLL_Previews: PreviewProvider {
    static var previews: some View {
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
    }
}
