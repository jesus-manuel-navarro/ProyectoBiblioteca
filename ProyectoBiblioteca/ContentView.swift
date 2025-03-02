//
//  ContentView.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Proyecto Biblioteca")
                    .font(.title)
                    .fontWeight(.bold)
                
                Image("portadalibros")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                Text("¿Qué leemos hoy?")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
        
            .navigationBarTitle(" ", displayMode:.inline)
                    
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                NavigationLink(destination: Biblioteca()) {
                    Text("Biblioteca")
                }
                NavigationLink(destination: Blog()) {
                    Text("Blog")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SignUpView()) {
                    Text("Login")
                }
            }
        }
        .foregroundColor(.gray)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
