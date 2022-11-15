//
//  char.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/19/22.
//

import SwiftUI

struct char: View {
    @State var SelectedItem:String
    @State var nombre:String = ""
    @State var alerta:Bool = false
    @State var alertaError:Bool = false
    @State var alertaAgregar:Bool = false
    @State var indexABorrar:Int = 0
    @State var keyABorrar:String = ""
    @State var NombreNueva:String = ""
    @State var valordepruevas:String = "asda"
    @State var SecionDinamico:secionInfo = secionInfo()
    @EnvironmentObject var Secion: secionInfo
    @State var elementos:[secionInfo] = [secionInfo(name: "Emma", tipo: "4x4", tiempos: [], Best: 0.0, worst: 0.0, Scrable: [], DateOfScrambel: []),
                                         secionInfo()]
    @State var DictionarioSeciones:[String: StrucGuardadr] = ["Default":StrucGuardadr()]
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination:
                                LineCharVew().environmentObject(Secion)
                    .padding(), label: {
                        DisplayPrincipal(Secion: SecionDinamico)
                    }).navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Stads")
                    .buttonStyle(PlainButtonStyle())
                Spacer()
                HStack{
                    Text("Sessions ").font(.largeTitle)
                    Spacer()
                    Spacer()
                    Button {
                        //alertaAgregar = true
                        TextAlert()
                                                
                    } label: {
                        Image(systemName: "plus.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25).foregroundColor(.blue)
                    }.alert(isPresented:$alertaAgregar) {
                        Alert(title: Text("Name already used"))
                        
                    }
                    
                    
                }.padding(.horizontal)
                Spacer()
                
                let lasLlavesd = [String](DictionarioSeciones.keys)
                let lasLlaves = lasLlavesd.sorted()
                List(lasLlaves.sorted().indices, id: \.self) { item in
                    let elvarlor = lasLlaves[item]
                    ContentList(SelectedItem: $SelectedItem, title: DictionarioSeciones[elvarlor]?.name ?? "",
                                tipe: DictionarioSeciones[elvarlor]?.tipo ?? "",
                                AVG: "\(DictionarioSeciones[elvarlor]?.promedio ?? 0.0)",
                                Total: "\(DictionarioSeciones[elvarlor]?.tiempos.count ?? 0)")
                    .swipeActions(content: {
                        Button {
                            if (SelectedItem == DictionarioSeciones[elvarlor]?.name ?? ""){
                                self.keyABorrar = DictionarioSeciones[elvarlor]?.name ?? ""
                                alertaError = true
                            }else{
                                self.keyABorrar = DictionarioSeciones[elvarlor]?.name ?? ""
                                alerta = true
                            }
                        }
                        
                    label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                    .tint(.red)
                        
                        
                    })
                    .alert(isPresented:$alerta) {
                        
                        Alert(title: Text("Delete session"), message: Text("Are you sure you want to delete the session?"), primaryButton: .destructive(Text("Erase"), action: {
                            withAnimation {
                                DictionarioSeciones.removeValue(forKey: keyABorrar)
                            }
                            Secion.GuardarDic(Dic: DictionarioSeciones)
                            
                        }), secondaryButton: .cancel())
                    }
                    .onTapGesture {
                        CambiarSecion(elvarlor: elvarlor)
              
                        
                    }
                    
                    
                    
                }.listStyle(.plain)
                    .padding(0)
                    .alert(isPresented:$alertaError) {
                        Alert(title: Text("Cannot delete current session"))
                        
                    }
                
                
                
                
                
            }
        }.navigationViewStyle(.stack)
            .onAppear{
                SecionDinamico = Secion
                DictionarioSeciones = Secion.cargar()
            }
        
    }
    func CambiarSecion(elvarlor:String){
        Secion.name = DictionarioSeciones[elvarlor]?.name ?? ""//item
        Secion.Best = DictionarioSeciones[elvarlor]?.Best ?? 0.0
        Secion.worst = DictionarioSeciones[elvarlor]?.worst ?? 0.0//item
        Secion.tipo = DictionarioSeciones[elvarlor]?.tipo ?? ""//item
        Secion.tiempos = DictionarioSeciones[elvarlor]?.tiempos ?? []//item
        Secion.Scrable = DictionarioSeciones[elvarlor]?.Scrable ?? []
        Secion.DateOfScrambel = DictionarioSeciones[elvarlor]?.DateOfScrambel ?? []
        Secion.AO12 = DictionarioSeciones[elvarlor]?.AO12 ?? 0.0
        Secion.AO5 = DictionarioSeciones[elvarlor]?.AO5 ?? 0.0
        Secion.BestAO5 = DictionarioSeciones[elvarlor]?.BestAO5 ?? 0.0
        Secion.BestAO12 = DictionarioSeciones[elvarlor]?.BestAO5 ?? 0.0

        //
        //
        //                        SecionDinamico = elementos[item]
        
        Secion.GuardarDic(Dic: DictionarioSeciones)//porque hago esto??
        //SecionDinamico = elementos[item] ? que pasa si pinemos eso jajaj
        SecionDinamico = Secion
        SecionDinamico = secionInfo(name: DictionarioSeciones[elvarlor]?.name ?? "",
                                    tipo: DictionarioSeciones[elvarlor]?.tipo ?? "",
                                    tiempos: DictionarioSeciones[elvarlor]?.tiempos ?? [],
                                    Best: DictionarioSeciones[elvarlor]?.Best ?? 0.0,
                                    worst: DictionarioSeciones[elvarlor]?.worst ?? 0.0,
                                    Scrable: DictionarioSeciones[elvarlor]?.Scrable ?? [],
                                    DateOfScrambel: DictionarioSeciones[elvarlor]?.DateOfScrambel ?? [])
        withAnimation {
                SelectedItem = DictionarioSeciones[elvarlor]?.name ?? ""
        }
    }
    func TextAlert(){
        let alert = UIAlertController(title: "Add new sessions", message: "Pick a new name", preferredStyle: .alert)
        alert.addTextField(){ nombre in
            nombre.placeholder = "Name"//el hint de donde se guarda
        }
        let AccpetAction = UIAlertAction(title: "Save", style: .default) { (_) in
            nombre = alert.textFields?[0].text! ?? ""
            if DictionarioSeciones.keys.contains(nombre) {
                alertaAgregar = true
            }else{
                withAnimation {
                    DictionarioSeciones[nombre] = StrucGuardadr(name: nombre, tipo: "3x3", tiempos: [], Best: 0.0, worst: 0.0, Scrable: [], DateOfScrambel: [])
                    Secion.GuardarDic(Dic: DictionarioSeciones)

                }
                CambiarSecion(elvarlor: nombre)

            }
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            print("cancel in click")
        }
        alert.addAction(cancelAction)
        alert.addAction(AccpetAction)
        

        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true,completion: {
            //doo someting
        })
    }
}
//}

struct char_Previews: PreviewProvider {
    static let myEnvObject = secionInfo()
    static var previews: some View {
        Group {
            char(SelectedItem: "Emma").environmentObject(myEnvObject)
            char(SelectedItem: "Emma").previewDevice("iPhone 8").environmentObject(myEnvObject)
            
        }
    }
}

struct DisplayPrincipal: View {
    var Secion: secionInfo
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(Secion.name).font(.title2).padding(.top).padding(.horizontal).foregroundColor(.blue)
                HStack(spacing: 0){
                    
                    VStack(alignment: .leading){
                        Spacer()
                        VStack(alignment: .leading, spacing: 0){
                            Text("Current")
                            Text(Secion.DisplayTimes(Time: Secion.tiempos.last ?? 0.0, Decimales: 1000)).font(.title2).foregroundColor(.green)
                            
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: 0){
                            Text("Ao 5")
                            Text(Secion.DisplayTimes(Time: Secion.AO5, Decimales: 1000))
                                .font(.title2).foregroundColor(.red)
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: 0){
                            Text("Ao 12")
                            
                            Text(Secion.DisplayTimes(Time: Secion.AO12, Decimales: 1000))
                                .font(.title2).foregroundColor(.blue)
                        }
                        Spacer()
                        
                        
                    }.frame(height: 210).padding(.horizontal)
                    
                    Spacer()
                    
                        cosasasBorrarDespues(lasecion: Secion).frame(width:200, height: 210)
                    if(UIDevice.current.userInterfaceIdiom == .pad){
                        Spacer()
                        Divider().frame(height: 220)
                        Spacer()
                        VStack(alignment: .leading){
                            Spacer()
                            VStack(alignment: .leading, spacing: 0){
                                Text("Best")
                                Text(Secion.DisplayTimes(Time: Secion.Best , Decimales: 1000)).font(.title2).foregroundColor(.green)
                                
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 0){
                                Text("Ao 5")
                                Text(Secion.DisplayTimes(Time: Secion.BestAO5, Decimales: 1000))
                                    .font(.title2).foregroundColor(.red)
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 0){
                                Text("Ao 12")
                                
                                Text(Secion.DisplayTimes(Time: Secion.BestAO12, Decimales: 1000))
                                    .font(.title2).foregroundColor(.blue)
                            }
                            Spacer()
                            
                            
                        }.frame(height: 210).padding(.horizontal)

                        cosasasBorrarDespues(lasecion: Secion).frame(width:200, height: 210)
                        Spacer()
                        
                    }
                    
                    
                    Image(systemName: "arrow.right.circle").frame(width: 30, height: 30).foregroundColor(.blue)
                    
                    
                }.padding()
            }.background(
                RoundedRectangle(cornerRadius: 15).foregroundColor(Color("G&W")).padding(7)
            )
            
        }
    }
}

struct ContentList: View {
    @Binding var SelectedItem:String
    let title: String
    let tipe: String
    let AVG: String
    let Total: String
    var body: some View {
        RoundedRectangle(cornerRadius: 15).foregroundColor(Color(title == SelectedItem ? .link : .systemGray4)).padding(0).frame(height: 95).overlay(
            HStack{
                VStack(alignment: .leading){
                    Text(title).font(.title)
                    Text(tipe).font(.subheadline)
                    Text(AVG).font(.subheadline)
                    
                }.padding()
                Spacer()
                ZStack(alignment: .center){
                    Circle()
                        .stroke(Color(.orange), lineWidth: 10).frame(width: 70, height: 70)
                    Text(Total)
                    
                }.padding(.trailing,30)
                
                
                
            }
            
        )
    }
}
