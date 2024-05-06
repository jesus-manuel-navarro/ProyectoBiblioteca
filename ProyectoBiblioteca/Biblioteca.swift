//
//  SwiftUIView.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 6/5/24.
//

import SwiftUI

struct Biblioteca: View {
    var libros = [ Libro(name: "Cebra", image: "portadalibros"),
                     Libro(name: "Leon", image: "portadalibros"),
                   Libro(name: "Bongo", image: "portadalibros")]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(libros) { libro in
                    NavigationLink(destination:LibroDetailView(libro: libro)){
                        MostrarEnListView(libro: libro)
                        
                    }
                }
                               
            }.navigationBarTitle("Mi Biblioteca", displayMode: .inline)
        }
        
    }
}

struct Biblioteca_Previews: PreviewProvider {
    static var previews: some View {
        Biblioteca()
    }
}

struct LibroDetailView: View {
    var libro: Libro
    var body: some View {
        VStack {
            Text(libro.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image(libro.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400)
                
            Spacer()
            
        }
        
    }
}

struct Libro: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct MostrarEnListView: View {
    var libro: Libro
    var body: some View {
        HStack {
            Image(libro.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(libro.name)
        }
    }
}

