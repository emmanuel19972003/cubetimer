//
//  tapbarcustom.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 1/30/22.
//

import SwiftUI

struct tapbarcustom: View {
    @Binding var tapsaadasda:Int
    @Namespace private var otrnombrequenoheusado
    var itemsss:[taps] = [taps(ids: 0, Icon: "suit.heart.fill", NotSelectIcon: "suit.heart", SelectedColor: .red),
                          taps(ids: 1, Icon: "plus.app.fill", NotSelectIcon: "plus.app", SelectedColor: .blue),
                          taps(ids: 2, Icon: "message.fill", NotSelectIcon: "message", SelectedColor: .green)]
    
    var body: some View {
        ZStack{
            Rectangle().frame(width: .infinity, height: 65)
                .cornerRadius(20)
                .foregroundColor(Color("G&W"))
                .padding(7)
            HStack {
                ForEach(itemsss.indices) { color in
                    Spacer()
                    VStack{
                        if (itemsss[color].ids == tapsaadasda){
                            Rectangle().matchedGeometryEffect(id: "labdasds", in: otrnombrequenoheusado).frame(width: 35, height: 3)
                                .foregroundColor(itemsss[color].SelectedColor)
                        }
                        Button(action: {
                            withAnimation{
                                tapsaadasda = color
                            }
                        }, label: {
                            Image(systemName: itemsss[color].ids == tapsaadasda ? itemsss[color].Icon:itemsss[color].NotSelectIcon)
                                .resizable().aspectRatio( contentMode: .fit)
                                .frame( height: itemsss[color].ids == tapsaadasda ? 40:35)
                                .foregroundColor(itemsss[color].ids == tapsaadasda ?itemsss[color].SelectedColor : itemsss[color].NotSelectColor)
                            
                        })
                        
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct tapbarcustom_Previews: PreviewProvider {
    @State var initVal = 0
    static var previews: some View {
        tapbarcustom(tapsaadasda: .constant(0))
    }
}
struct taps {
    var ids:Int
    var Icon:String
    var NotSelectIcon:String
    var SelectedColor:Color
    var NotSelectColor:Color = Color("B&W")
}

