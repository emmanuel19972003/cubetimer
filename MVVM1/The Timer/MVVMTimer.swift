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
        @Published var Tapfinal:Bool = false
        @Published var diosmio:Bool = true

        func TimerSetChange(value:Double, color:Color, Cstate:Bool){
            contador = value
            TextColor = color
            StartStop = Cstate
        }
                
    }
    
}

