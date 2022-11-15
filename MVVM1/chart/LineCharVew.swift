//
//  LineCharVew.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 3/20/22.
//

import SwiftUI

struct LineCharVew: View {
    @EnvironmentObject var Secion: secionInfo
    var body: some View {
        VStack{
            Text(Secion.name).font(.title3)
            if (Secion.tiempos.isEmpty){
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(.systemGray4))
                    Text("No data")
                }
            }
            else{
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke().foregroundColor(Color(.systemGray4))
                    lineChart(tiempos: Secion.tiempos).padding(.horizontal,5)
                }
            }
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    Text("Records").font(.title2).padding()
                    NavigationLink(destination:
                                    TimeList(Secion: Secion).environmentObject(Secion)
                                    
                                    
                        .padding(), label: {
                            Times(titel: "Times list", Content: "", imagen: "hourglass", ColorIcono: .white, ColorFondo: .purple)
                            
                        })
                    
                    LandMasks(titel: "Best", Content: "\(Secion.DisplayTimes(Time: Secion.Best, Decimales: 1000))", imagen: "star.fill", ColorIcono: .white, ColorFondo: .green)
                    LandMasks(titel: "Ao5", Content: "\(Secion.DisplayTimes(Time: Secion.BestAO5, Decimales: 1000))", imagen: "5.square", ColorIcono: .white, ColorFondo: .mint)
                    LandMasks(titel: "Ao12", Content: "\(Secion.DisplayTimes(Time: Secion.BestAO12, Decimales: 1000))", imagen: "12.square", ColorIcono: .white, ColorFondo: .mint)
                    LandMasks(titel: "Worst", Content: "\(Secion.DisplayTimes(Time: Secion.worst, Decimales: 1000))", imagen: "xmark.square", ColorIcono: .white, ColorFondo: .red.opacity(0.8))
                    

                    Divider()
                }
                VStack(alignment: .leading, spacing: 0){
                    Text("Current").font(.title2).padding()
                    
                    LandMasks(titel: "Current", Content: "\(Secion.DisplayTimes(Time: Secion.tiempos.last ?? 0.0, Decimales: 1000))", imagen: "1.square", ColorIcono: .white, ColorFondo: .blue.opacity(0.7))
                    LandMasks(titel: "Ao5", Content: "\(Secion.DisplayTimes(Time: Secion.AO5, Decimales: 1000))", imagen: "5.square", ColorIcono: .white, ColorFondo: .blue.opacity(0.7))
                    LandMasks(titel: "Ao12", Content: "\(Secion.DisplayTimes(Time: Secion.AO12, Decimales: 1000))", imagen: "12.square", ColorIcono: .white, ColorFondo: .blue.opacity(0.7))
                    LandMasks(titel: "AVG", Content: "\(Secion.DisplayTimes(Time: Secion.promedio, Decimales: 1000))", imagen: "number.square", ColorIcono: .white, ColorFondo: .blue.opacity(0.7))
                    Divider()
                }
            }
            
            
            
        }.onAppear{
            Secion.calPromedio5()
            Secion.calPromedio12()
            Secion.CalBestOf5()
            Secion.CalBestOf12()
            
        }
    }
}

struct LineCharVew_Previews: PreviewProvider {
    static let myEnvObject = secionInfo()
    static var previews: some View {
        LineCharVew().environmentObject(myEnvObject)
    }
}

struct LandMasks: View {
    var titel: String
    var Content: String
    var imagen: String
    var ColorIcono: Color
    var ColorFondo: Color
    var body: some View {
        VStack(spacing: 0) {
            Divider().padding(.bottom,5)
            //            Rectangle()
            //                .stroke()
            //                .foregroundColor(Color(.systemGray4))
            
            HStack{
                //"hare.fill"
                Image(systemName: imagen)
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 31, height: 31)
                    .foregroundColor(ColorIcono)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 12).foregroundColor(ColorFondo)
                    )
                Text(titel)
                Spacer()
                Text(Content)
            }
            
            .padding(.horizontal)
        }.frame(height: 50)
            .padding(0)
    }
}

struct Times: View {
    var titel: String
    var Content: String
    var imagen: String
    var ColorIcono: Color
    var ColorFondo: Color
    var body: some View {
        VStack(spacing: 0) {
            Divider().padding(.bottom,5)
            HStack{
                Image(systemName: imagen)
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 31, height: 31)
                    .foregroundColor(ColorIcono)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 12).foregroundColor(ColorFondo)
                    )
                Text(titel)
                Spacer()
                Text(Content)
                Image(systemName: "arrow.right.circle")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    //.foregroundColor(Color(.link))
                    .padding(5)
                    
            }
            
            .padding(.horizontal)
        }.frame(height: 50)
            .padding(0)
    }
}
