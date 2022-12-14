//
//  cosasasBorrarDespues.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/20/22.
//

import SwiftUI

struct cosasasBorrarDespues: View {
    var promedio: Double
    var AO12: Double
    var AO5: Double
    var Best: Double
    var espacio:Double
    init(lasecion: secionInfo) {
        
        if (lasecion.Best == 0){
            self.Best = 1
        }else{
            self.Best = lasecion.Best
        }
        if (lasecion.AO5 == 0){
            self.AO5 = 1
            self.AO12 = 1
        }else{
            self.AO5 = lasecion.AO5
            self.AO12 = lasecion.AO12
        }
        if (lasecion.AO12 == 0){
            self.AO12 = self.AO5
        }else{
            self.AO12 = lasecion.AO12
        }
        if (lasecion.promedio == 0){
            self.promedio = Best
        }else{
            self.promedio = lasecion.promedio
        }
        self.promedio = max(AO12, AO5, promedio)*1.1
        self.espacio = promedio/4
        
        }
    var body: some View {
        //("\(String(format: "%.3f", viewmodel.contador))")
        
        Group {
            GeometryReader { geometry in
                ZStack{
                    HStack(alignment: .bottom, spacing: 15) {
                        Capsule().frame(width: 45, height: 192).foregroundColor(.clear)
                        //
                        Capsule().frame(width: 1, height: 192).foregroundColor(.clear)
                        chartBarr(valor: ((Best)/promedio)*100, nombre: "B", colorBack: .blue, colorFrente: .red)
                        chartBarr(valor: ((AO5)/promedio)*100, nombre: "Ao5", colorBack: .blue, colorFrente: .red)
                        chartBarr(valor: ((AO12)/promedio)*100, nombre: "Ao12", colorBack: .blue, colorFrente: .red)
                       
                    }//.frame(width: 170, height: 220)
                    .background(
                        VStack(alignment: .trailing){
                            HStack(spacing: 0){
                                Text("\(String(format: "%.1f", espacio*4))").frame(width: 60)
                                Rectangle().frame(height: 2).foregroundColor(.gray)
                            }
                            Spacer()
                            HStack(spacing: 0){
                                Text("\(String(format: "%.1f", espacio*3))").frame(width: 60)
                                Rectangle().frame(height: 2).foregroundColor(.gray)
                            }
                            Spacer()
                            HStack(spacing: 0){
                                Text("\(String(format: "%.1f", espacio*2))").frame(width: 60)
                                Rectangle().frame(height: 2).foregroundColor(.gray)
                            }
                            Spacer()
                            HStack(spacing: 0){
                                Text("\(String(format: "%.1f", espacio))").frame(width: 60)
                                Rectangle().frame(height: 2).foregroundColor(.gray)
                                
                            }
                            Spacer()
                            HStack(spacing: 0){
                                Text("0").frame(width: 60)
                                Rectangle().frame(height: 2)
                                
                            }
                            Spacer()
                        }
                        
                        
                        
                    )
                }
            }
        }//.frame(width: 500, height: 500)
        
        
        
    }
}

struct cosasasBorrarDespues_Previews: PreviewProvider {
    static var previews: some View {
        cosasasBorrarDespues(lasecion: secionInfo())
    }
}

struct chartBarr: View {
    let valor:Double
    let nombre:String
    let colorBack:Color
    let colorFrente:Color
    var body: some View {
        VStack {
            ZStack(alignment: .bottom){
                //                RoundedCorners(color: .blue, tl: 8, tr: 8, bl: 3, br: 3)
                //                    .frame(width: 30, height: 200)
                //                    .foregroundColor(colorBack)
                
                RoundedCorners(color: colorBack, tl: 8, tr: 8, bl: 3, br: 3)
                //Rectangle()
                    .frame(width: 24, height: (CGFloat(valor)/100)*192).foregroundColor(colorFrente.opacity(0.9)).padding(.vertical,4)
                
            }
            Text(nombre)
        }
    }
}
struct RoundedCorners: View {
    var color: Color
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}
