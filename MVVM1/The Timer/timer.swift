//
//  timer.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/13/22.
//

import SwiftUI

struct timer: View {
    var cube1: Thecube = Thecube()
    @EnvironmentObject var Secion: secionInfo
    @StateObject private var viewmodel = modelodeTimer()
    @State var TheScramble:String
    @State var DictionarioSeciones:[String: StrucGuardadr] = [:] //UserDefaults.standard.data(forKey: "Diccionario") as? [String: StrucGuardadr] ?? [String: StrucGuardadr]()
    @State var Start:Bool = false
    @State var track:Double = 0.0
    @State var ContadorGestos:Int = 0
    let timer = Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Rectangle().frame(width: .infinity, height: 65)
                        .cornerRadius(20)
                        .foregroundColor(Color("G&W"))
                        .padding(.horizontal, 7)
                    HStack{
                        Menu("\(Secion.tipo)") {
                            Button {
                                Secion.CambairTipo(tipo: "2x2")
                                TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                            } label: {Text("2x2")}
                            Button {
                                Secion.CambairTipo(tipo: "3x3")
                                TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                            } label: {Text("3x3")}
                            Button {
                                Secion.CambairTipo(tipo: "4x4")
                                TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                            } label: {Text("4x4")}
                            Button {
                                Secion.CambairTipo(tipo: "5x5")
                                TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                            } label: {Text("5x5")}
                            Button {
                                Secion.CambairTipo(tipo: "6x6")
                                TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                            } label: {Text("6x6")}
                            Button {
                                Secion.CambairTipo(tipo: "7x7")
                                TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                            } label: {Text("7x7")}
                            
                        }
                        Spacer()
                        Text(Secion.name)
                        
                        Spacer()
                        if (Secion.tipo == "3x3"){
                            NavigationLink(destination: cubeView(TheScramble:TheScramble)) {
                                Image(systemName: "eye").resizable().aspectRatio( contentMode: .fit).frame(width: 30, height: 30)
                            }
                            
                        }
                    }.padding(.horizontal, 15)
                }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .padding(.top,15)
                if(UIDevice.current.userInterfaceIdiom == .pad){
                    Text(TheScramble)
                        .multilineTextAlignment(.center).font(.largeTitle).onTapGesture {
                            TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                        }.padding()
                }else{
                    Text(TheScramble)
                        .multilineTextAlignment(.center).font(Secion.getFont()).onTapGesture {
                            TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                        }.padding()
                }
                
                
                                
                
                
                //Spacer()
                
                Text(viewmodel.Dispalytime)
                    .foregroundColor(viewmodel.TextColor).font(.system(size: 80.0)).frame( maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("W&B"))
                    .onReceive(timer) { (_) in
                        viewmodel.contador = viewmodel.contador + 0.01
                        if (viewmodel.StartStop && viewmodel.contador > 0.5){
                            viewmodel.TextColor = .green
                            ContadorGestos = 0
                        }
                        if (Start){
                            //withAnimation {
                            viewmodel.Dispalytime = Secion.DisplayTimes(Time: viewmodel.contador, Decimales: 100)
                            //}
                            
                        }
                        
                    }
                    .onTapGesture(count: 2, perform: {
                        // corrgir metodo de + 2
                        if (ContadorGestos == 0 && !Secion.tiempos.isEmpty){
                            let timepo2 = Secion.tiempos[Secion.tiempos.count-1] + 2.00
                            viewmodel.Dispalytime = ("+ \(String(format: "%.3f", timepo2))")
                            
                            Secion.Borrar(pos: (Secion.tiempos.count - 1))
                            //revisar si era mejro y corregir
                            Secion.tiempos.append(timepo2)
                            Secion.calPromedio5()
                            Secion.calPromedio12()
                            Secion.calPromedioTotal()
                            Secion.BesrtOrWorsr(Current: timepo2)//aca lo puedo llamar, seria coqueto
                            Secion.DateOfScrambel.append(Secion.GetDate())
                            Secion.Scrable.append(TheScramble)
                            Secion.GuardarDic(Dic: DictionarioSeciones)
                        }
                        
                        
                    })
                    .gesture(
                        DragGesture()
                            .onEnded{ valie in
                                let moveX = valie.translation.width
                                track = moveX
                                if (moveX > 100 ){
                                    //esto de mas DNf
                                    if (ContadorGestos == 0 && !Secion.tiempos.isEmpty){
                                        viewmodel.Dispalytime = "DNF"
                                        self.ContadorGestos += 1
                                        Secion.Borrar(pos: (Secion.tiempos.count - 1))
//                                        Secion.tiempos.append(0.0)
//                                        Secion.calPromedio5()
//                                        Secion.calPromedio12()
//                                        Secion.calPromedioTotal()
//                                        Secion.BesrtOrWorsr(Current: 0.0)
//                                        Secion.DateOfScrambel.append(Secion.GetDate())
//                                        Secion.Scrable.append(TheScramble)
//                                        Secion.GuardarDic(Dic: DictionarioSeciones)
                                        
                                        
                                    }
                                }else if moveX < -100 {
                                    // gesto de borrar
                                    if (ContadorGestos == 0 && !Secion.tiempos.isEmpty){
                                        viewmodel.Dispalytime = "Ready"
                                        
                                        self.ContadorGestos += 1
                                        Secion.Borrar(pos: (Secion.tiempos.count - 1))
                                        Secion.GuardarDic(Dic: DictionarioSeciones)//provar 
                                        
                                    }
                                    
                                    
                                }
                                
                                
                            }
                        
                    )
                
                    .onLongPressGesture(minimumDuration: .infinity, maximumDistance: 200) { (ispresing) in
                        if (!Start){
                            if (ispresing){
                                viewmodel.TimerSetChange(color: .red, Cstate: true)
                                
                            }else{
                                if (viewmodel.contador > 0.5){
                                    viewmodel.TimerSetChange(color: Color("B&W"), Cstate: true)
                                    Start = true
                                    viewmodel.StartStop = false//ojo con esto
                                }else{
                                    viewmodel.TimerSetChange(color: Color("B&W"), Cstate: false)
                                    
                                }
                                
                            }
                        }else{
                            //aca termino el solve
                            let centesimas = Double.random(in: 0...0.009)
                            let tiempoAcgtual = viewmodel.contador + Double(centesimas)
                            viewmodel.contador = 0
                            Start = false
                            Secion.tiempos.append(tiempoAcgtual)
                            Secion.calPromedio5()
                            Secion.calPromedio12()
                            Secion.calPromedioTotal()
                            Secion.BesrtOrWorsr(Current: tiempoAcgtual)//aca lo puedo llamar, seria coqueto
                            Secion.DateOfScrambel.append(Secion.GetDate())
                            Secion.Scrable.append(TheScramble)
                            Secion.GuardarDic(Dic: DictionarioSeciones)
                            TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                            //Secion.Guardar()

                            
                            
                        }
                        
                    } perform: {
                        viewmodel.StartStop = true
                    }
                
                Spacer().navigationBarTitleDisplayMode(.inline)
                HStack{
                    if(UIDevice.current.userInterfaceIdiom == .pad){
                        Spacer()
                    }
                    VStack{
                        Text("Ao 5")
                        
                        Text("\(Secion.DisplayTimes(Time: Secion.AO5, Decimales: 1000))")
                        Text("Best: \(Secion.DisplayTimes(Time: Secion.BestAO5, Decimales: 1000))")
                    }
                    Spacer()
                    VStack{
                        Text("Best: \(Secion.DisplayTimes(Time: Secion.Best, Decimales: 1000))")
                        
                    }
                    Spacer()
                    VStack{
                        Text("Ao 12")
                        Text("\(Secion.DisplayTimes(Time: Secion.AO12, Decimales: 1000))")
                        Text("Best: \(Secion.DisplayTimes(Time: Secion.BestAO12, Decimales: 1000))")
                    }
                    if(UIDevice.current.userInterfaceIdiom == .pad){
                        Spacer()
                    }
                }.padding(.horizontal)
                .onAppear {
                    DictionarioSeciones = Secion.cargar()
                    Secion.calPromedio5()
                    Secion.calPromedio12()
                    Secion.CalBestOf5()
                    Secion.CalBestOf12()
                    //TheScramble  = ContentView.cube1.Scramble(Type: Secion.tipo)[0]
                    UIApplication.shared.isIdleTimerDisabled = true
                }
            }.background(Color("W&B"))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
        .edgesIgnoringSafeArea(.top)
        
        
    }
    func fireTimer() {
        print("Timer fired!")
    }
}


struct timer_Previews: PreviewProvider {
    static let myEnvObject = secionInfo()
    static var previews: some View {
        timer( TheScramble: "R U R2 L").environmentObject(myEnvObject)
    }
}
