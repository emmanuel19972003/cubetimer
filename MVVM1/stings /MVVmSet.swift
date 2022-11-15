//
//  MVVmSet.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 5/5/22.
//

import Foundation
import SwiftUI
extension setings {
    
    @MainActor class MVVmSet: ObservableObject{
        //func getDAta()
        
        @Published var StadOnTimer:infomracionStegins = infomracionStegins(imagen: "align.vertical.bottom.fill", atrivuto: "et", Estado: true, colorImagen: ".blue", texto: "Show Stats on timer")
        
        @Published var inspection:infomracionStegins = infomracionStegins(imagen: "stopwatch.fill", atrivuto: "in", Estado: false, colorImagen: ".orange", texto: "Inspection Time")
        //lightbulb.circle.fill
        @Published var focusmMode:infomracionStegins = infomracionStegins(imagen: "lightbulb.circle.fill", atrivuto: "fm", Estado: true, colorImagen: ".green", texto: "Show time while solving")
        @Published var textSize:infomracionStegins = infomracionStegins(imagen: "lightbulb.circle.fill", atrivuto: "ts", Estado: false, colorImagen: ".green", texto: "18")
        @Published var icon:infomracionStegins = infomracionStegins(imagen: "lightbulb.circle.fill", atrivuto: "ts", Estado: true, colorImagen: ".green", texto: "0")
        @Published var SlecteIcon = 0
        
        
        
    }
    
    
}
struct infomracionStegins:Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    let imagen: String
    let atrivuto: String
    var Estado: Bool
    let colorImagen:String
    var texto:String
    init(imagen: String, atrivuto: String, Estado: Bool, colorImagen:String, texto:String)  {
        self.imagen = imagen
        self.atrivuto = atrivuto
        self.Estado = Estado
        self.colorImagen = colorImagen
        self.texto = texto
        getdata()
    }
    func obtenerColor() -> Color{
        if (self.colorImagen == ".green"){
            return .green
        }else if (self.colorImagen == ".orange"){
            return .orange
        }else {
            return .blue
        }
        
    }
    mutating func CambiarTextoSize(valor:Int){
        var elValor = Int (self.texto) ?? 0
        if (Estado){
            elValor = elValor + valor
            if (elValor < 31 && elValor > 0){
                self.texto = "\(elValor)"
                saveData()
            }
        }
        
    }
    mutating func cambiarEstado(){
        self.Estado.toggle()
    }
    mutating func getdata(){
        guard
            let data = UserDefaults.standard.data(forKey: self.atrivuto),
            let otracosa = try? JSONDecoder().decode(infomracionStegins.self, from: data)
        else {return}
        
        self = otracosa
     
        
//        listaPLLflitrada = listaPLLccarga
    }

    func saveData(){
        if let codeData = try? JSONEncoder().encode(self){
            UserDefaults.standard.set(codeData, forKey: self.atrivuto)
        }
    }
}
