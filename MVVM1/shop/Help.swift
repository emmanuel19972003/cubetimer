//
//  Help.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 4/9/22.
//

import SwiftUI

struct Help: View {
    let unarry:[String] = ["afs","hdghgdf","sfgjuyj"]
    //@Environment(\.colorScheme) var colorScheme
    let HalturaTotal:CGFloat = 370
    let HalturaBajo:CGFloat = 120
    @State var nombre = ""
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView{
                
                TabView{//aprendido
                    carucelFAcil(LaInstruccion: Instrucciones(Imagenb: "new SC blanco", Descripcion: "Tap the algorithm to generate a new one"))
                    carucelFAcil(LaInstruccion: Instrucciones(Imagenb: "Borrar Tiempo", Descripcion: "Swipe left to erase last time"))
                    carucelFAcil(LaInstruccion: Instrucciones(Imagenb: "add penalty", Descripcion: "Double tap to add +2 penalty"))
                    carucelFAcil(LaInstruccion: Instrucciones(Imagenb: ("new se"), Descripcion: "Tap on the add icon to add a new session"))
                    carucelFAcil(LaInstruccion: Instrucciones(Imagenb: ("Borrar seciones Blanco"), Descripcion: "Swipe left to erase session"))
                    carucelFAcil(LaInstruccion: Instrucciones(Imagenb: "Grafica", Descripcion: "Drag your finger over the graph to show the times"))
                    carucelFAcil(LaInstruccion: Instrucciones(Imagenb: "aprendido", Descripcion: "Swipe left to label algorithms as learned, learning or unmark"))
                }.tabViewStyle(.page(indexDisplayMode: .always))
                    .frame(height: HalturaTotal)
                //.padding(.top)
                Divider()
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Info").font(.largeTitle).padding()
                    Text("Next updates:").font(.title2).padding(.horizontal)
                    Text("-  Scramble reviewer for 2x2 – 7x7").font(.title2).padding(.horizontal)
                    Text("-  Language internalization").font(.title2).padding(.horizontal)
                    Text("This app was debelop by Emmanuel Zambrano, Contact information: emmanuel1997@gmail.com  ").font(.title2).padding()
                }
                
                //-    Language internalization
            }
            
            
            
            
            
            
            Spacer()
            
            
        }.padding(.top,62)
            .edgesIgnoringSafeArea(.top)
        
        //.background(.red)
    }
    
}



struct Help_Previews: PreviewProvider {
    static var previews: some View {
        Help()
    }
}
struct Instrucciones{
    let Imagenb:String
    let Descripcion:String
    
}

struct carucelFAcil: View {
    let LaInstruccion:Instrucciones
    let HalturaTotal:CGFloat = 370
    let HalturaBajo:CGFloat = 120
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("G&W"))
                .background(.ultraThinMaterial)
            VStack{
                Image(LaInstruccion.Imagenb).resizable().aspectRatio(contentMode: .fit).frame(height: HalturaTotal - HalturaBajo-25).padding(.top)
                Spacer()
                
                ZStack(alignment: .top){
                    RoundedCorners(color: .blue.opacity(0.9), tl: 0, tr: 0, bl: 25, br: 25)
                    Text("\(LaInstruccion.Descripcion)").frame( maxWidth: .infinity,maxHeight: 70,alignment: .center).padding()
                }.frame(height: HalturaBajo,alignment: .leading)
            }
        }.frame(height: HalturaTotal).padding()
    }
}
