//
//  setings.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 5/5/22.
//

import SwiftUI

struct setings: View {
    @StateObject private var viewmodel = MVVmSet()
    @State private var selectedPage =  UserDefaults.standard.integer(forKey: "TheIcon") ?? 0

    var body: some View {
       
        ZStack {
            //Rectangle().foregroundColor(Color(.systemGray5)).ignoresSafeArea()
            ScrollView{
                VStack(spacing: 0){
                    HStack( spacing: 0){
                        Mosaico(valores: viewmodel.StadOnTimer).onTapGesture {
                            
                            withAnimation {
                                viewmodel.StadOnTimer.Estado.toggle()
                            }
                            viewmodel.StadOnTimer.saveData()
                        }
                        Mosaico(valores: viewmodel.inspection).onTapGesture {
                            
                            withAnimation {
                                viewmodel.inspection.Estado.toggle()
                            }
                            viewmodel.inspection.saveData()
                            
                        }
                    }
                    HStack(spacing: 0){
                        
                        VStack(spacing: 0){
                            //focusmMode
                            Mosaico(valores: viewmodel.focusmMode).onTapGesture {
                                
                                withAnimation {
                                    viewmodel.focusmMode.Estado.toggle()
                                }
                                viewmodel.focusmMode.saveData()
                            }
                            MosaicoAncho(valores: $viewmodel.icon, selectedPage: $selectedPage)
                                
                        }
                        Mosaicolargo(valores: $viewmodel.textSize).onTapGesture {
                            
                            withAnimation {
                                viewmodel.textSize.Estado.toggle()
                            }
                            viewmodel.textSize.saveData()
                        }
                    }
                    
                }
            }
        }.onAppear{
            //selectedPage = Int(viewmodel.icon.texto) ?? 0
        }
    }
}

struct setings_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            setings()
            setings()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
        }
    }
}


struct Mosaico: View {
    var type:String = "cuadro"
    var alto:CGFloat = 170
    var ancho:CGFloat = 170
    var color: Color = .white
    var valores: infomracionStegins = infomracionStegins(imagen: "", atrivuto: "", Estado: false, colorImagen: ".blue", texto: "")
    init(){
        self.alto = 170
    }
    init(valores: infomracionStegins){
        self.alto = 170
        self.valores = valores
    }
    init(type: String, valores: infomracionStegins){
        if (type == "rec"){
            self.alto = 170 * 2
        }else if (type == "largo") {
            self.alto = 170
            self.ancho = 170 * 2
        }
        self.valores = valores
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15).frame(width: ancho, height: alto).foregroundColor(.clear)
            RoundedRectangle(cornerRadius: 15)
                

                .shadow(color: .black, radius: 3, x: 0, y: 0)
                .frame(width: ancho - 10, height: alto - 10)
                .foregroundColor(valores.Estado ? color.opacity(1) : color.opacity(0.7))
            VStack(alignment: .leading,spacing: 0){
                Spacer()
                HStack(alignment: .top){
                    Image(systemName: valores.imagen).resizable().aspectRatio(contentMode: .fit)
                        .foregroundColor(valores.obtenerColor())
                        .frame(width: 60, height: 60)
                        .padding(5)
                    Spacer()
                    if (valores.Estado){
                        Image(systemName: "checkmark.circle.fill").resizable().aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                            .frame(width: 30, height: 30)
                            .padding(.horizontal)
                    }else{
                        Image(systemName: "x.circle.fill").resizable().aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(width: 30, height: 30)
                            .padding(.horizontal)
                    }
                    
                }
                
                Spacer()
                Text(valores.texto).padding(.horizontal, 6.0).font(.title3).foregroundColor(.black)
                Spacer()
            }.frame(width: ancho - 10, height: alto - 10)
        }
        
    }
    
}
struct Mosaicolargo: View {
    var alto:CGFloat = 340
    var ancho:CGFloat = 170
    var color: Color = .white
    @Binding var valores: infomracionStegins
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15).frame(width: ancho, height: alto).foregroundColor(.clear)
            RoundedRectangle(cornerRadius: 15)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
                .frame(width: ancho - 10, height: alto - 10)
                .foregroundColor(valores.Estado ? color.opacity(1) : color.opacity(0.7))
            VStack(alignment: .center,spacing: 0){
                Text("Font Size").font(.title3).bold()
                    .padding().foregroundColor(.black)
                Image(systemName: "plus.circle.fill").resizable().aspectRatio(contentMode: .fit)
                    .foregroundColor(valores.Estado ? Color("GWG") : .gray)
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        valores.CambiarTextoSize(valor: 1)
                    }
                Text(valores.texto).font(.system(size: 70.0)).frame(width: 90, height: 150)
                    .foregroundColor(.black)
                Image(systemName: "minus.circle.fill").resizable().aspectRatio(contentMode: .fit)
                //Color(.systemGray3)
                    .foregroundColor(valores.Estado ? Color("GWG") : Color(.gray))
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        valores.CambiarTextoSize(valor: -1)
                    }
                Spacer()
                
                
            }.frame(width: ancho - 10, height: alto - 10)
        }
    }
    
}

struct MosaicoAncho: View {
    var alto:CGFloat = 170
    var ancho:CGFloat = 170
    var color: Color = .white
    @Binding var valores: infomracionStegins
    @Binding var selectedPage: Int
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 15).frame(width: ancho, height: alto).foregroundColor(.clear)
            RoundedRectangle(cornerRadius: 15)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
                .frame(width: ancho - 10, height: alto - 10)
                .foregroundColor(color.opacity(1))
            VStack(alignment: .center,spacing: 0){
                //Text("Icon").font(.title3).padding(.top)
                TabView(selection: $selectedPage){
                    Image("azulClaro").resizable().aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .tag(0)
                    Image("morado").resizable().aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .tag(1)
 
                }.tabViewStyle(.page(indexDisplayMode: .always))
                    .padding(.vertical,10)
                    .onChange(of: selectedPage) { value in
                        if (value == 0){
                            UIApplication.shared.setAlternateIconName(nil)
                        }else if (value == 1){
                            UIApplication.shared.setAlternateIconName("AppIcon-1")
                        }
                        let defaults = UserDefaults.standard
                        defaults.set(value, forKey: "TheIcon")
                        
                        valores.texto = "\(value)"
                        valores.saveData()
                                    
                                }
                    
                
                
            }.frame(width: ancho - 10, height: alto - 10)
        }
    }
    
}
