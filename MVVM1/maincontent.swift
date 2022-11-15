//
//  ContentView.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 12/23/21.
//

import SwiftUI

struct ContentView: View {
    //UserDefaults.standard.object(forKey: "username") as? String ?? ""
    @StateObject  var Secion =  secionInfo()
    @StateObject private var viewmodel = modelodeVista()
    static var cube1: Thecube = Thecube()
    @State var TheScramble:String  = ""
    @State var  sadad:Int = 2
    var body: some View {
        VStack {
            if (viewmodel.tap == 0){
                timer(TheScramble: ContentView.cube1.Scramble(Type: Secion.tipo)[0]).environmentObject(Secion).navigationBarTitle("")
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.top)
                
                //Spacer()
            }else if (viewmodel.tap == 1){
                //Spacer()
                char(SelectedItem: Secion.name).environmentObject(Secion)
            }else if (viewmodel.tap == 2){
                AlgsByType().environmentObject(Secion).navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.top)
            }else if (viewmodel.tap == 3){
                Help()
            }else if (viewmodel.tap == 4){
                setings()
                
            }
//            else{
//                //Borradores()
//                Help()
//                
//
//                
//                
//            }
            
            Spacer()
            //jajaj(elValor: $viewmodel.tap)
            
            
            tapbarcustom(tapsaadasda:$viewmodel.tap,itemsss:[taps(ids: 0, Icon: "stopwatch.fill", NotSelectIcon: "stopwatch", SelectedColor: .blue),
                                                             taps(ids: 1, Icon: "chart.line.uptrend.xyaxis.circle.fill", NotSelectIcon: "chart.line.uptrend.xyaxis.circle", SelectedColor: .green),
                                                             taps(ids: 2, Icon: "cube.fill", NotSelectIcon: "cube", SelectedColor: .red),
                                                             taps(ids: 3, Icon: "wrench.and.screwdriver.fill", NotSelectIcon: "wrench.and.screwdriver", SelectedColor: .orange),
                                                             taps(ids: 4, Icon: "gearshape.fill", NotSelectIcon: "gearshape", SelectedColor: .gray)
                                                            ]).background(Color("W&B"))
            
            
        }.background(Color("W&B"))
            //.edgesIgnoringSafeArea(.top)
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}

struct jajaj: View {
    @Binding var elValor:Int
    var body: some View {
        Text("la atap select es \(elValor)").onTapGesture {
            elValor += 1
        }
    }
}
