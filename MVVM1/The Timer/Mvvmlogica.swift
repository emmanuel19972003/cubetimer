//
//  Mvvmlogica.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 12/23/21.
//

import Foundation
extension ContentView{
    //private(set), lo hace todo muy importante
    @MainActor class modelodeVista: ObservableObject{
        @Published var nombre:String = ""
        @Published var tap:Int = 0
        func changeTap (){
            tap = tap + 1
        }
        
    }
}
class tapselection: ObservableObject {
    @Published var varol = false
    func negar(){
        varol.toggle()
    }
}


 

