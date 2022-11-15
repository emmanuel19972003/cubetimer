//
//  AlgsByType.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 4/17/22.
//

import SwiftUI

struct AlgsByType: View {
    @EnvironmentObject var Secion: secionInfo
    var body: some View {
        if (Secion.tipo == "2x2"){
            _x2Algs()
        }else if (Secion.tipo == "4x4"){
            Algs4X4()
        }
        else{
            listaAlgs()
        }
    }
}

struct AlgsByType_Previews: PreviewProvider {
    static let myEnvObject = secionInfo()
    static var previews: some View {
        AlgsByType().environmentObject(myEnvObject)
    }
}
