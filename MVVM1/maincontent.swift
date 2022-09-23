//
//  ContentView.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 12/23/21.
//

import SwiftUI

struct maincontent: View {
    @StateObject private var viewmodel = modelodeVista()
    //@EnvironmentObject var laQueDaLacarga = tapselection
    //@State var  sadad:Int = 2
    var body: some View {
        VStack{
            TextField("Placeholder", text: $viewmodel.nombre).padding()
            Text("Hello \(viewmodel.nombre)")
                .padding()
            Spacer()
            Text("la atap select es \(viewmodel.tap)").onTapGesture {
                viewmodel.changeTap()
            }
            Spacer()
            tapbarcustom(tapsaadasda:viewmodel.tap,itemsss:[taps(ids: 0, Icon: "suit.heart.fill", NotSelectIcon: "suit.heart", SelectedColor: .red),
                                  taps(ids: 1, Icon: "plus.app.fill", NotSelectIcon: "plus.app", SelectedColor: .blue),
                                  taps(ids: 2, Icon: "message.fill", NotSelectIcon: "message", SelectedColor: .green)])
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            maincontent()
            
        }
    }
}
