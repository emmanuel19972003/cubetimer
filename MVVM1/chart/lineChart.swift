//
//  lineChart.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 2/26/22.
//

import SwiftUI

struct lineChart: View {
    @State var current:Double = 0.0
    @State var ofset:CGSize = .zero
    @State var ShowPlot:Bool = false
    let tiempos: [Double]
    var maxY:Double = 20.0
    var Promedio:Double = 20.75
    var minY:Double = 0
    var maxPos:Int = 0
    var minPos:Int = 0
    let Color: Color = .blue
    init(tiempos: [Double]) {
        self.tiempos = tiempos
        self.maxY = tiempos.max() ?? 0
        self.minY = tiempos.min() ?? 0
        self.minY = minY - (minY*0.2)
        var acu:Double = 0
        for i in (tiempos.indices){
            if (tiempos[i] == maxY){
                self.maxPos = i
            }
            if (tiempos[i] == tiempos.min()){
                self.minPos = i
            }
            acu = acu + tiempos[i]
        }
        
        self.Promedio = acu/Double(tiempos.count)
    }
    
    var body: some View {
        GeometryReader{ geometry in
            let yAxis = maxY - minY
            let xSize = geometry.size.width
            let height = geometry.size.height
            let width = geometry.size.height
            let steps = Int(geometry.size.width)/(tiempos.count)
            let jaja = (tiempos.enumerated())
            
            
            ZStack(alignment: .topLeading){
                Group(){
                    
                    Path{ path in
                        for i in tiempos.indices{
                            let xPos = geometry.size.width / CGFloat(tiempos.count) * CGFloat(i + 1)
                            
                            let yPos = (1 -  CGFloat(tiempos[i]-minY)/yAxis)*geometry.size.height
                            if (i == 0 ){
                                path.move(to: CGPoint(x:xPos, y:yPos))
                            }
                            
                            
                            path.addLine(to: CGPoint(x:xPos, y:yPos))
                        }
                        
                    }.stroke(Color, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        .shadow(color: Color, radius: 10, x: 0.0, y: 10)
                    //.shadow(color: Color.opacity(0.5), radius: 10, x: 0.0, y: 20)
                    //.shadow(color: Color.opacity(0.2), radius: 10, x: 0.0, y: 30)
                    //.shadow(color: Color.opacity(0.1), radius: 10, x: 0.0, y: 40)
                    
                    
                    
                    Circle().position(CGPoint(x: geometry.size.width / CGFloat(tiempos.count) * CGFloat(maxPos + 1), y: (1 -  CGFloat(tiempos[maxPos]-minY)/yAxis)*geometry.size.height)) .frame(width: 10, height: 10)
                        .foregroundColor(.red)
                    Circle().position(CGPoint(x: geometry.size.width / CGFloat(tiempos.count) * CGFloat(minPos + 1), y: (1 -  CGFloat(tiempos[minPos]-minY)/yAxis)*geometry.size.height)) .frame(width: 10, height: 10)
                        .foregroundColor(.green)
                    
                    Path{ path in
                        let xPos1 = geometry.size.width / CGFloat(tiempos.count) * CGFloat(1)
                        let yPos1 = (1 -  CGFloat(Promedio-minY)/yAxis)*geometry.size.height
                        path.move(to: CGPoint(x:xPos1, y:yPos1))
                        path.addLine(to: CGPoint(x:xSize, y:yPos1))
                    }.stroke(.yellow, style: StrokeStyle(lineWidth: 1, dash: [15]))
                    
                    
                    
                    
                }
                VStack(spacing: 0){
                    Text("\(String(format: "%.2f", current))")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(.red, in: Capsule())
                    Rectangle()
                        .fill().frame(width: 1, height: 70)
                    Rectangle()
                        .frame(width: 1, height: 22)
                    
                    Rectangle()
                        .fill().frame(width: 1, height: 70)
                }.opacity(ShowPlot ? 1 : 0)
                    .offset(ofset)
                
            }
            .contentShape(Rectangle())
            .gesture(DragGesture().onChanged({ Value in
                withAnimation {
                    ShowPlot = true
                    
                    let translation = Value.location.x//aca se puede hacer un ajuste
                    
                    
                    let index = (((Int(translation)-steps)/steps))+1
                    if (index >= tiempos.count || index<0){
                        ShowPlot = false
                    }else{
                        current = Double(tiempos[index])
                        ofset = CGSize(width: translation, height: 0)
                    }
                    
                    //let yPosoffset = (1 -  CGFloat(tiempos[index]-minY)/yAxis)*geometry.size.height
                    //(Int(translation) / (Int(geometry.size.width)/(tiempos)))
                    // min(Int((translation/geometry.size.width).rounded()),tiempos.count - 1)
                    //min((Int(translation))/(Int(geometry.size.width)/(tiempos.count - 1)),tiempos.count - 1)
                    //(Int(translation))/(Int(geometry.size.width)/(tiempos.count - 1))
                    //
                    
                    
                    
                }
            }).onEnded({ Value in
                ShowPlot = false
            })
            )
            
            
            
            
            
            
            
        }.frame( height: 200)
            .background(
                VStack{
                    Divider()
                    Spacer()
                    Divider()
                    Spacer()
                    Divider()
                    Spacer()
                    Divider()
                    Spacer()
                    Divider()
                }
            )
            .overlay(
                
                VStack(){
                    Text("\(String(format: "%.2f", maxY))").bold().background()
                    Spacer()
                    let medio = (maxY + minY)/2
                    Text("\(String(format: "%.2f", medio))").bold().background()
                    Spacer()
                    Text("\(String(format: "%.2f", minY))").bold().background()
                    
                    
                    
                },alignment: .leading
            )
    }
}

struct lineChart_Previews: PreviewProvider {
    static var previews: some View {
        lineChart(tiempos: [5.0,4.0,6.0,2.0,7.0,9.0,7.0,5.0,4.0,4.0,6.0,7.0,3.0,2.0,6.0,8.0])
    }
}
