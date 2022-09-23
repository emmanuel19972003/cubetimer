//
//  MVVMTimer.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/15/22.
//

import Foundation
import SwiftUI

extension timer {
    @MainActor class modelodeTimer: ObservableObject{
        @Published var Dispalytime:String = "Ready"
        @Published var TextColor:Color = Color("B&W")
        @Published var StartStop:Bool = false
        @Published var contador:Double = 0.000
        func TimerSetChange(color:Color, Cstate:Bool){
            contador = 0
            TextColor = color
            StartStop = Cstate
        }
                
    }
    
}

