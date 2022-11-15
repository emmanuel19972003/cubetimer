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
    @State var BorradoCof:Bool = false
    //@State var Tapfinal:Bool = false
    var statOnTimer: infomracionStegins = infomracionStegins(imagen: "align.vertical.bottom.fill", atrivuto: "et", Estado: true, colorImagen: ".blue", texto: "Show Stats on timer")
    var showTimer: infomracionStegins = infomracionStegins(imagen: "lightbulb.circle.fill", atrivuto: "fm", Estado: true, colorImagen: ".green", texto: "Show time while solving")
    var textSize:infomracionStegins = infomracionStegins(imagen: "lightbulb.circle.fill", atrivuto: "ts", Estado: false, colorImagen: ".green", texto: "18")
    var inspection:infomracionStegins = infomracionStegins(imagen: "stopwatch.fill", atrivuto: "in", Estado: false, colorImagen: ".orange", texto: "Inspection Time")
    let timer = Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()
    @State var acumuladorInsp:Double = 0.0
    @State var inicioIspeccion:Bool = false
    @State var inicioIpeanl:Bool = false
    @State var penalDNF:Bool = false
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
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
                                Button {
                                    Secion.CambairTipo(tipo: "Clock")
                                    TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                                } label: {Text("Clock")}
                                Button {
                                    Secion.CambairTipo(tipo: "Skewb")
                                    TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                                } label: {Text("Skewb")}
                                
                                Button {
                                    Secion.CambairTipo(tipo: "Pyraminx")
                                    TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                                } label: {Text("Pyraminx")}
                                Button {
                                    Secion.CambairTipo(tipo: "Megaminx")
                                    TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                                } label: {Text("Megaminx")}
                                
                            }
                            Spacer()
                            Text(Secion.name)
                            
                            Spacer()
                            if (Secion.tipo == "3x3"){
                                NavigationLink(destination: preb7x7(size: 3, scramble: TheScramble)) {
                                    Image(systemName: "eye").resizable().aspectRatio( contentMode: .fit).frame(width: 30, height: 30)
                                }
                                
                                
                            }else if (Secion.tipo == "2x2"){
                                NavigationLink(destination: preb7x7(size: 2, scramble: TheScramble)) {
                                    Image(systemName: "eye").resizable().aspectRatio( contentMode: .fit).frame(width: 30, height: 30)
                                }
                                
                            }
                            else if (Secion.tipo == "4x4"){
                                NavigationLink(destination: preb7x7(size: 4, scramble: TheScramble)) {
                                    Image(systemName: "eye").resizable().aspectRatio( contentMode: .fit).frame(width: 30, height: 30)
                                }
                                
                            }else if (Secion.tipo == "5x5"){
                                NavigationLink(destination: preb7x7(size: 5, scramble: TheScramble)) {
                                    Image(systemName: "eye").resizable().aspectRatio( contentMode: .fit).frame(width: 30, height: 30)
                                }
                                
                            }else if (Secion.tipo == "6x6"){
                                NavigationLink(destination: preb7x7(size: 6, scramble: TheScramble)) {
                                    Image(systemName: "eye").resizable().aspectRatio( contentMode: .fit).frame(width: 30, height: 30)
                                }
                                
                            }else if (Secion.tipo == "7x7"){
                                NavigationLink(destination: preb7x7(size: 7, scramble: TheScramble)) {
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
                        if textSize.Estado{
                            let TZ = CGFloat(Int(textSize.texto) ?? 18)
                            Text(TheScramble)
                                .multilineTextAlignment(.center).font(.system(size: TZ)).onTapGesture {
                                    TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                                }.padding()
                        }else{
                            Text(TheScramble)
                                .multilineTextAlignment(.center).font(Secion.getFont()).onTapGesture {
                                    TheScramble = cube1.Scramble(Type: Secion.tipo)[0]
                                }.padding()
                        }
                        
                    }
                    
                    Text(viewmodel.Dispalytime)
                        .foregroundColor(viewmodel.TextColor).font(.system(size: 80.0)).frame( maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("W&B"))
                        .onReceive(timer) { (_) in
                            withAnimation {
                                viewmodel.contador = viewmodel.contador + 0.01
                            }
                            
                            
                            
                            
                            if (viewmodel.StartStop && viewmodel.contador > 0.5){
                                viewmodel.TextColor = .green
                                ContadorGestos = 0
                            }
                            if (Start){
                                //withAnimation {
                                if (showTimer.Estado){
                                    viewmodel.Dispalytime = Secion.DisplayTimes(Time: viewmodel.contador, Decimales: 100)
                                }else{
                                    viewmodel.Dispalytime = "Timing"
                                    viewmodel.TextColor = .green
                                }
                                
                            }
                            if (inicioIspeccion){
                                viewmodel.Dispalytime = "\(Int(acumuladorInsp))"
                                acumuladorInsp = acumuladorInsp + 0.01
                                if (acumuladorInsp > 15 && acumuladorInsp<17){
                                    inicioIpeanl = true
                                    viewmodel.Dispalytime = "+ 2"
                                    //DnfMetod
                                }else if (acumuladorInsp > 17){
                                    inicioIpeanl = false
                                    penalDNF = true
                                    viewmodel.Dispalytime = "DNF"
                                    //DnfMetod
                                }
                            }
                            
                            
                            
                        }
                        .onTapGesture{
                            if (inspection.Estado){
                                acumuladorInsp = 0
                                inicioIspeccion = true
                                viewmodel.Tapfinal = true
                            }
                        }
                        .onTapGesture(count: 2) {
                            penal2()
                        }
                        .gesture(
                            DragGesture()
                                .onEnded{ valie in
                                    let moveX = valie.translation.width
                                    track = moveX
                                    if (moveX > 100 ){
                                        //esto de mas DNf
                                        DnfMetod()
                                    }else if moveX < -100 {
                                        // gesto de borrar
                                        getoBorrar()
                                        
                                        
                                    }
                                    
                                    
                                }
                            
                        )
                        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: 200) { (ispresing) in
                            if (!inspection.Estado){
                                if (!Start){
                                    
                                    if (ispresing){
                                        viewmodel.TimerSetChange(value: 0.0, color: .red, Cstate: true)
                                        
                                    }else{
                                        if (viewmodel.contador > 0.5){
                                            viewmodel.TimerSetChange(value: 0.0, color: Color("B&W"), Cstate: true)
                                            Start = true
                                            viewmodel.StartStop = false//ojo con esto
                                            viewmodel.Tapfinal = true
                                        }else{
                                            viewmodel.TimerSetChange(value: 0.0, color: Color("B&W"), Cstate: false)
                                            
                                        }
                                        
                                    }
                                }else{
                                    //aca termino el solve
                                    finTimer()                                //Secion.Guardar()
                                }
                            }
                            
                            
                            
                            
                        }
                perform: {
                    if (!inspection.Estado){
                        viewmodel.StartStop = true
                    }
                    
                    
                    
                }
                    
                    Spacer().navigationBarTitleDisplayMode(.inline)
                    if (statOnTimer.Estado) {
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
                                Text("solves: \(Secion.tiempos.count)")
                                
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
                    }
                }.background(Color("W&B"))
                if (BorradoCof){
                    ZStack{
                        Capsule().frame(width: 300, height: 50).foregroundColor(Color(.systemGray4).opacity(0.5))
                        Text("Has been erased!").foregroundColor(.white)
                    }
                }
                
                ///consa que ceunta
                if (viewmodel.Tapfinal){
                    
                    if (inspection.Estado ){
                        Rectangle().frame( maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.red.opacity(0.008))
                            .onTapGesture {
                                //finTimer()
                                if (Start){
                                    viewmodel.Tapfinal = false
                                    acumuladorInsp = 0.0
                                    inicioIspeccion = false
                                }
                                
                            }
                            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: 200) { (ispresing) in
                                
                                if (!Start){
                                    
                                    if (ispresing){
                                        viewmodel.TimerSetChange(value: 0.0, color: .red, Cstate: true)
                                        
                                    }else{
                                        if (viewmodel.contador > 0.5){
                                            viewmodel.TimerSetChange(value: 0.0, color: Color("B&W"), Cstate: true)
                                            Start = true
                                            viewmodel.StartStop = false//ojo con esto
                                            viewmodel.Tapfinal = true
                                            acumuladorInsp = 0.0
                                            inicioIspeccion = false
                                            ContadorGestos = 0
                                        }else{
                                            viewmodel.TimerSetChange(value: 0.0, color: Color("B&W"), Cstate: false)
                                        }
                                        
                                    }
                                }else{
                                    //aca termino el solve
                                    finTimer()
                                    //viewmodel.Tapfinal = false
                                    viewmodel.diosmio = false
                                    
                                }
                            }
                    perform: {
                        viewmodel.StartStop = true
                    }
                        
                        //
                        
                        
                    }else{
                        Rectangle().frame( maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.black.opacity(0.01))
                            .onTapGesture {
                                finTimer()
                                viewmodel.Tapfinal = false
                                
                            }
                        
                    }
                }
                
                
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
        .edgesIgnoringSafeArea(.top)
        
        
    }
    func finTimer() {
        viewmodel.Tapfinal = false
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
        viewmodel.Dispalytime = Secion.DisplayTimes(Time: tiempoAcgtual, Decimales: 1000)
        viewmodel.TextColor = Color("B&W")
        if(inicioIpeanl){
            penal2()
        }
        if(penalDNF){
            DnfMetod()
            
        }
        //viewmodel.diosmio = false
    }
    
    func penal2(){
        if (ContadorGestos == 0 && !Secion.tiempos.isEmpty){
            if !(viewmodel.Dispalytime == "Ready"){
                self.ContadorGestos += 1
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
            
        }
        
    }
    
    func DnfMetod(){
        if (ContadorGestos == 0 && !Secion.tiempos.isEmpty){
            viewmodel.Dispalytime = "DNF"
            self.ContadorGestos += 1
            Secion.Borrar(pos: (Secion.tiempos.count - 1))
            Secion.GuardarDic(Dic: DictionarioSeciones)
            
        }
    }
    
    func getoBorrar(){
        if (ContadorGestos == 0 && !Secion.tiempos.isEmpty){
            viewmodel.Dispalytime = "Ready"
            
            self.ContadorGestos += 1
            Secion.Borrar(pos: (Secion.tiempos.count - 1))
            Secion.GuardarDic(Dic: DictionarioSeciones)//provar
            BorradoCof = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation (.easeInOut(duration: 0.5)){
                    BorradoCof = false
                }
                
            }
            
            
        }
    }
    
    
    private func delayText() async {
        // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        //hasTimeElapsed = true
    }
    
}


struct timer_Previews: PreviewProvider {
    static let myEnvObject = secionInfo()
    static var previews: some View {
        timer( TheScramble: "R U R2 L").environmentObject(myEnvObject)
    }
}
