//
//  SecionInfo.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/19/22.
//

import Foundation
import SwiftUI
struct StrucGuardadr: Codable{
    var name:String
    var tipo:String
    var tiempos: [Double]
    var Best: Double
    var worst: Double
    var promedio: Double
    var AO12: Double
    var AO5: Double
    var BestAO12: Double
    var BestAO5: Double
    var Scrable: [String]
    var DateOfScrambel: [String]
    
    init(name:String, tipo:String,tiempos:[Double],Best:Double,worst:Double, Scrable:[String], DateOfScrambel: [String]){
        self.name = name
        self.tipo = tipo
        self.tiempos = tiempos
        self.Best = Best
        self.worst = worst
        self.promedio = 0.0 // calcular el promedio de la secion
        self.AO12 = 0.0
        self.AO5 = 0.0
        self.BestAO5 = 0.0
        self.BestAO12 = 0.0
        self.Scrable = Scrable
        self.DateOfScrambel = DateOfScrambel
    }
    init(){
        name = "Default"
        tipo = "3x3"
        tiempos = []
        Best = 0.0
        worst = 0.0
        promedio = 0.0
        AO12 = 0.0
        AO5 = 0.0
        BestAO5 = 0.0
        BestAO12 = 0.0
        Scrable = []
        DateOfScrambel = []
        
        
    }
}
class secionInfo: ObservableObject{
    @Published var name:String
    @Published var tipo:String
    @Published var tiempos: [Double]
    @Published var Best: Double
    @Published var worst: Double
    @Published var promedio: Double
    @Published var AO12: Double
    @Published var AO5: Double
    @Published var BestAO12: Double
    @Published var BestAO5: Double
    @Published var Scrable: [String]
    @Published var DateOfScrambel: [String]
    
    
    init(){
        name = "Default"
        tipo = "3x3"
        tiempos = []
        Best = 0.0
        worst = 0.0
        promedio = 0.0
        AO12 = 0.0
        AO5 = 0.0
        BestAO5 = 0.0
        BestAO12 = 0.0
        Scrable = []
        DateOfScrambel = []
        
        
    }
    
    init(name:String, tipo:String,tiempos:[Double],Best:Double,worst:Double, Scrable:[String], DateOfScrambel: [String]){
        self.name = name
        self.tipo = tipo
        self.tiempos = tiempos
        self.Best = Best
        self.worst = worst
        self.promedio = 0.0 // calcular el promedio de la secion
        self.AO12 = 0.0
        self.AO5 = 0.0
        self.BestAO5 = 0.0
        self.BestAO12 = 0.0
        self.Scrable = Scrable
        self.DateOfScrambel = DateOfScrambel
        
       
        self.calPromedio5()
        self.calPromedio12()
        self.calPromedioTotal()
        self.CalBestOf5()
        self.CalBestOf12()
        //
    }
    
    func getFont() -> Font{
        var TextSize: Font = .largeTitle
        if (tipo == "7x7" || tipo == "6x6"  ){
            TextSize = .title3
        }else if (tipo == "4x4" || tipo == "5x5" || tipo == "Clock" ){
            TextSize = .title
        }else if (tipo == "Megaminx"){
            TextSize = .subheadline
        }
        else { //defalut 3x3 o 2x2
            TextSize = .largeTitle
        }
        return TextSize
    }
 
    
    func CambairTipo(tipo:String){
        self.tipo = tipo
    }
    
    func BesrtOrWorsr(Current:Double){
        if (Current != 0.0){
            if (Best == 0.0){
                Best = Current
            }else{
                if (Current < Best){
                    Best = Current
                }else if (Current > worst){
                    worst = Current
                }
            }
            self.CalBestOf5()
            self.CalBestOf12()
        }
        
        
    }
    

    func calPromedio5(){
        var promedio:Double = 0.0
        
        if (tiempos.count > 4){
            let upperBound = tiempos.count
            let lowerBoiund = upperBound - 5
            let TrimArra = tiempos[lowerBoiund..<upperBound]
            for i in TrimArra.indices{
                if (!((TrimArra.max() == TrimArra[i]) || (TrimArra.min() == TrimArra[i]))){
                    promedio = promedio + TrimArra[i]
                    
                }
            }
            AO5 = promedio/3
        }
        
        
    }
    
    
    func calPromedio12(){
        var promedio:Double = 0.0
        if (tiempos.count > 11){
            let upperBound = tiempos.count
            let lowerBoiund = upperBound - 12
            let TrimArra = tiempos[lowerBoiund..<upperBound]
            print(TrimArra)
            for i in TrimArra.indices{//ageglar lo del maximo y ninimo
                if (!((TrimArra.max() == TrimArra[i]) || (TrimArra.min() == TrimArra[i]))){
                    
                    promedio = promedio + TrimArra[i]
                    
                }
            }
            AO12 = promedio/10
        }else{
            AO12 = 0.0
        }
        
    }
    func calPromedioTotal(){
        var CAlpromedio:Double = 0.0
        if (tiempos.count > 0){
            let upperBound = tiempos.count
            let TrimArra = tiempos[0..<upperBound]
            for i in TrimArra.indices{//ageglar lo del maximo y ninimo
                
                    CAlpromedio = CAlpromedio + TrimArra[i]
                    
                
            }
            self.promedio = CAlpromedio/Double(tiempos.count)
        }else{
            promedio = 0.0
        }

        
        
    }
    func CalBestOf5(){
        var BestPosInit = 0
        let size = tiempos.count - 4
        var best = BestAO5
        var acu = 0.0
        var n:Int  = 0
        var fin:Int = 0
        var contadorMaxMin = 0
        if (size >= 1){
            for _ in 0..<(size){
                fin = n + 4
                let trimArray = tiempos[n...fin]
                print(trimArray)
                for _ in n...(fin){
                    if ((trimArray.min() == tiempos[n] || trimArray.max() == tiempos[n]) && contadorMaxMin < 2){
                        contadorMaxMin += 1
                    }else{
                        acu = tiempos[n] + acu
                    }
                    n += 1
                }
                contadorMaxMin = 0
                acu = acu/3
                print(acu)
                if (acu < best || BestAO5 == 0){
                    BestAO5 = acu
                    BestPosInit = n - 5
                    best = acu
                }
                n -= 4
                acu = 0
                
            }
            BestAO5 = best
            
        }else{
            BestAO5 = 0.0
        }
    }
    func CalBestOf12(){
        var BestPosInit = 0
        let size = tiempos.count - 11
        var best = 0.0
        var acu = 0.0
        var n:Int  = 0
        var fin:Int = 0
        var contadorMaxMin = 0
        if (size >= 1){
            for _ in 0..<(size){
                fin = n + 11
                let trimArray = tiempos[n...fin]
                print(trimArray)
                for _ in n...(fin){
                    if ((trimArray.min() == tiempos[n] || trimArray.max() == tiempos[n]) && contadorMaxMin < 2){
                        contadorMaxMin += 1
                    }else{
                        acu = tiempos[n] + acu
                    }
                    n += 1
                }
                contadorMaxMin = 0
                acu = acu/10
                print(acu)
                if (acu < best || best == 0){
                    BestAO12 = acu
                    BestPosInit = n - 12
                    best = acu
                }
                n -= 11
                
                acu = 0
                
            }
        }else{
            BestAO12 = 0
        }
    }
    
    func DisplayTimes (Time:Double, Decimales:Int) -> String{
        let tsegundos:Int = Int(Time)
        let milis:Int = Int((Time - Double(tsegundos))*Double(Decimales))
        let horas:Int = Int(tsegundos / 3600)
        let minutos:Int = Int((tsegundos - horas*3600)/60)
        let seg:Int = Int(tsegundos - (horas*3600+minutos*60))
        

        var text = ""
        var segundos = ""
        var minutosStringt = ""
       
        
        if (horas > 0){
            if (seg < 10){
                segundos = "0\(seg)"
            }else{
                segundos = "\(seg)"
            }
            
            if (minutos < 10){
                minutosStringt = "0\(minutos)"
            }else{
                minutosStringt = "\(minutos)"
            }
            
            text = "\(horas):\(minutosStringt):\(segundos).\(milis) "
            
        }else if(minutos > 0){
            if (seg < 10){
                text = "\(minutos):0\(seg).\(milis) "
            }else{
                text = "\(minutos):\(seg).\(milis) "
            }
            
            
        }else{
            if (seg < 10){
                text = "\(seg).\(milis)"
            }else{
                text = "\(seg).\(milis)"
            }
            
        }
        return text
        
    }
    func GetDate() -> String{
        let date = Date()
        let components = Calendar.current.dateComponents([.year,.day,.month], from: date)
        let ano = components.year ?? 0
        let dia = components.day ?? 0
        let mes = components.month ?? 0
        return "\(mes)/\(dia)/\(ano)"
    }
    
    func Guardar(){
        let ParaGuardar: StrucGuardadr = StrucGuardadr(name: self.name, tipo: self.tipo, tiempos: self.tiempos, Best: self.Best, worst: self.worst, Scrable: self.Scrable, DateOfScrambel: self.DateOfScrambel)
        if let codigdata = try? JSONEncoder().encode(ParaGuardar){
            UserDefaults.standard.set(codigdata, forKey: "Secion1")
        }
        
    }
    func GuardarDic(Dic:[String: StrucGuardadr]){
        var Eldic = Dic
        let ParaGuardar: StrucGuardadr = StrucGuardadr(name: self.name, tipo: self.tipo, tiempos: self.tiempos, Best: self.Best, worst: self.worst, Scrable: self.Scrable, DateOfScrambel: self.DateOfScrambel)
        Eldic[self.name] = ParaGuardar
        if let codigdata = try? JSONEncoder().encode(Eldic){
            UserDefaults.standard.set(self.name, forKey: "LasSecion")
            UserDefaults.standard.set(codigdata, forKey: "Diccionario")
        }
        
        
    }
    
    func cargar() -> [String: StrucGuardadr]{
        
        guard
            let Nombre = UserDefaults.standard.string(forKey: "LasSecion"),
            let ElDic = UserDefaults.standard.data(forKey: "Diccionario"),
            let DataGuardada = try? JSONDecoder().decode([String: StrucGuardadr].self, from: ElDic)
        else{return [:]}

        self.name = DataGuardada[Nombre]?.name ?? ""
        self.tipo = DataGuardada[Nombre]?.tipo ?? ""
        self.tiempos = DataGuardada[Nombre]?.tiempos ?? []
        self.Best = DataGuardada[Nombre]?.Best ?? 0.0
        self.worst = DataGuardada[Nombre]?.worst ?? 0.0
        self.promedio = DataGuardada[Nombre]?.promedio ?? 0.0// calcular el promedio de la secion
        self.AO12 = DataGuardada[Nombre]?.AO12 ?? 0.0
        self.AO5 = DataGuardada[Nombre]?.AO5 ?? 0.0
        self.BestAO5 = DataGuardada[Nombre]?.BestAO5 ?? 0.0
        self.BestAO12 = DataGuardada[Nombre]?.BestAO12 ?? 0.0
        self.Scrable = DataGuardada[Nombre]?.Scrable ?? []
        self.DateOfScrambel = DataGuardada[Nombre]?.DateOfScrambel ?? []
        
       
        self.calPromedio5()
        self.calPromedio12()
        self.calPromedioTotal()
        self.CalBestOf5()
        self.CalBestOf12()
        return DataGuardada
        
    }


    func Borrar(pos:Int){
        //Cosa de memoria
        if (!tiempos.isEmpty){
            if (tiempos[pos] == Best){
                tiempos.remove(at: pos)
                Best = tiempos.min() ?? 0.0
            }
            else if (tiempos[pos] == worst){
                tiempos.remove(at: pos)
                worst = tiempos.max() ?? 0.0
            }
            else{
                tiempos.remove(at: pos)
            }
            self.calPromedio5()
            self.calPromedio12()
            self.CalBestOf5()
            self.CalBestOf12()
        }
        Guardar()
        
    }
    
    
    
}
