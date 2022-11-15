//
//  TimeList.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 3/29/22.
//

import SwiftUI

struct TimeList: View {
    @ObservedObject var Secion: secionInfo
//    @ObservedObject var Secion: secionInfo = secionInfo(name: "Emma", tipo: "4x4", tiempos: [12.32,12.343,12.3297,12.34356,15.042,11.4353], Best: 12.0, worst: 15.0, Scrable: ["R","L","U","D","F","B",], DateOfScrambel: [])
    let tamaTarjeta:CGFloat = 250
    @State var DictionarioSeciones:[String: StrucGuardadr] = [:]
    let columns = [GridItem(.adaptive(minimum: 90))]
    @State var tarjeta:Bool = false
    @State var SelectedPos:Int = 0
    //@State var ElColor:Bool = true
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    Rectangle().frame(width: .infinity, height: 65)
                        .cornerRadius(20)
                        .foregroundColor(Color("G&W"))
                        .padding(.horizontal, 7)
                    Text(Secion.name).font(.title2)
                }.padding(.vertical)
                if (Secion.tiempos.isEmpty){
                    Text("No times to show!").font(.largeTitle)
                }else{
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 25) {
                            ForEach(Secion.tiempos.indices, id: \.self) { i in
                                let Tama = Secion.tiempos.count - 1
                                let tiempo = Secion.tiempos[Tama - i]
                                var Bestv:Bool = false
                                var Worst:Bool = false
                                
                                ZStack{
                                    if Secion.tiempos[Tama - i] == Secion.Best{
                                        RoundedRectangle(cornerRadius: 10).foregroundColor(.green).frame(height: 50)
                                            .shadow(color: .black, radius: 15, x: 2, y: 2)
                                            .shadow(color: .gray, radius: 3, x: 2, y: 2)
                                    }else if Secion.tiempos[Tama - i] == Secion.tiempos.max(){
                                        RoundedRectangle(cornerRadius: 10).foregroundColor(.red).frame(height: 50)
                                            .shadow(color: .black, radius: 15, x: 2, y: 2)
                                            .shadow(color: .gray, radius: 3, x: 2, y: 2)
                                    }else{
                                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color("G&W")).frame(height: 50)
                                            .shadow(color: .black, radius: 15, x: 2, y: 2)
                                            .shadow(color: .gray, radius: 3, x: 2, y: 2)
                                    }
                                    
                                    //(cornerRadius: 10).stroke(lineWidth: 1.5).frame(height: 50)
                                        
                                    //Text("\(Secion.DisplayTimes(Time: tiempo, Decimales: 1000))").font(.title2)
                                    if (tiempo == 0.0){
                                        Text("DNF").font(.title2)
                                    }else{
                                        Text("\(Secion.DisplayTimes(Time: tiempo, Decimales: 1000))").font(.title2)
                                    }
                                }
                                .padding(.horizontal,5)
                                .onTapGesture {
                                    SelectedPos = Tama - i
                                    withAnimation(.easeIn) {
                                        tarjeta = true
                                    }
                                    
                                }
                            }
                        }.padding(.horizontal)
                    }
                }
                
                
                Spacer()
            }
            
            
            if (tarjeta){
                Rectangle().frame( maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                    .foregroundColor(.white.opacity(0.01)).onTapGesture {//esto es mi fondon
                        tarjeta = false
                    
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 13).stroke(lineWidth: 5)
                        .frame(height: tamaTarjeta)
                        .foregroundColor(.blue)
                        .shadow(color: Color("B&BK"), radius: 10, x: 0, y: 9)
                        
                    RoundedRectangle(cornerRadius: 13)
                        .frame(height: tamaTarjeta)
                        .foregroundColor(.blue)
                        .shadow(color: Color("B&BK"), radius: 10, x: 0, y: 9)
                    HStack{
                        VStack{
                            Image(systemName: "x.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 35, height: 35)
                                .foregroundColor(.clear)
                            Spacer()
                        }.padding(.horizontal)
                        Spacer()
                        VStack(){
                            Spacer()
                            let Tiempo1 = Secion.tiempos[SelectedPos]
                            if (Tiempo1 == 0.0){
                                Text("DNF").font(.title2)
                            }else{
                                Text("\(Secion.DisplayTimes(Time: Tiempo1, Decimales: 1000))").font(.title2)
                            }
                            
                            
                            Text(Secion.Scrable[SelectedPos]).font(.title2).foregroundColor(.secondary)
                            Text(Secion.DateOfScrambel[SelectedPos]).font(.title2).foregroundColor(.secondary)
                            Spacer()
                            ZStack{
                                let TheRed = Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                Circle().frame(width: 48, height: 48)
                                    .shadow(color: TheRed, radius: 10, x: 3, y: 3)
                                    .foregroundColor(TheRed)
                                
                                Image(systemName: "trash.circle").resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45)
                                    .foregroundColor(.white)
                            }.padding(.bottom)
                            .onTapGesture {
                                tarjeta = false
                                withAnimation {
                                    Secion.Borrar(pos: SelectedPos)
                                    Secion.GuardarDic(Dic: DictionarioSeciones)
                                    
                                    
                                }
                                //print("Emma")
                                
                                
                            }
                            
                        }
                        Spacer()
                        VStack{
                            ZStack{
                                //let TheBlue = Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)
                                Circle().frame(width: 45, height: 45)
                                    .foregroundColor(.black)
                                    .shadow(color: .gray, radius: 10, x: 2, y: 2)
                                    //.shadow(color: .white, radius: 10, x: 2, y: 2)
                                    
                                
                                Image(systemName: "x.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45)
                                    .foregroundColor(.white)//Color("G&W")
                                    
                            }.onTapGesture {
                                withAnimation(.easeOut) {
                                    tarjeta = false
                                }
                            }
                            
                            Spacer()
                        }.padding()
                        
                        
                    }.frame(height: tamaTarjeta)
                    
                }
            }
            
            
            
        }
            //.padding(.top,15)
            .onAppear {
                DictionarioSeciones = Secion.cargar()
            }
    }
}

struct TimeList_Previews: PreviewProvider {
    @ObservedObject var Secion: secionInfo
    static let myEnvObject = secionInfo()
    static var previews: some View {
        TimeList(Secion: secionInfo()).environmentObject(myEnvObject)
    }
}
