//
//  Borradores.swift
//  MVVM1
//
//  Created by Emmanuel Zambrano Quitian on 4/12/22.
//

import SwiftUI

struct Borradores: View {
    @State var nombre = ""
    var body: some View {
        VStack{
            Button {
                //TextAlert()
                print("Emma")
            } label: {
                Text("show")
            }
            Text(nombre)

        }
    }
//    func TextAlert(){
//        let alert = UIAlertController(title: "Alert titel", message: "Mesnaje", preferredStyle: .alert)
//        alert.addTextField(){ nombre in
//            nombre.placeholder = "nombre"
//        }
//        let AccpetAction = UIAlertAction(title: "Nombre", style: .default) { (_) in
//            nombre = alert.textFields?[0].text! ?? ""
//            print("Log in click")
//        }
//        let cancelAction = UIAlertAction(title: "cancelar", style: .destructive) { (_) in
//            print("cancel in click")
//        }
//        alert.addAction(AccpetAction)
//        alert.addAction(cancelAction)
//
//        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true,completion: {
//            //doo someting
//        })
//    }
}

struct Borradores_Previews: PreviewProvider {
    static var previews: some View {
        Borradores()
    }
}
