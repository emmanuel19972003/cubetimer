//
//  MVVM1App.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 12/23/21.
//

import SwiftUI

@main
struct MVVM1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
struct CurrentSetin{
    let name:String = ""
    let TipeCube:String = ""
    var best:Double = 0.0
    var worst:Double = 0.0
    var Times:[Double] = []
    var deviation:Double = 0.0
    
}

