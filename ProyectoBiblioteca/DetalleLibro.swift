//
//  DetalleLibro.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 7/5/24.
//

import SwiftUI

struct DetalleLibro: View {
    var libro : Libro
    var body: some View {
        ZStack {
            Image(libro.image)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
            HStack{
               // Spacer()
                VStack(alignment: .leading){
                    //Spacer()
                    Text(" \(libro.titulo) \n Autor: \(libro.autor) \n Género: \(libro.genero) ")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.5))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                )
                            )
                    .padding(.bottom)
                    
                    ScrollView {
                        Text("Sinopsis: \(libro.sinopsis)")
                            .font(.title2)
                            //.lineSpacing(12)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.5))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                    )
                        )
                    }
                        
                    Spacer()
                    Button(action: descargar){
                        Image(systemName: "arrow.clockwise")
                    }
                    .font(.title)
                    .padding(.top)
                }
            }
            
            .multilineTextAlignment(.leading)
            .padding()
            
        }
    }
        
    }

func descargar(){
    
}
/* struct DetalleLibro_Previews: PreviewProvider {
    static var previews: some View {
        DetalleLibro(libro: libro)
    }
} */
//, autor: "Pepe el Botifarra", genero: "Folklore"
