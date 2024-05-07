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
        
        .navigationBarTitle("Proyecto Biblioteca")
                    
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
                NavigationLink(destination: Login()) {
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
