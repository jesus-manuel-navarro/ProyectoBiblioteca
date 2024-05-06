//
//  SwiftUIView.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 6/5/24.
//

import SwiftUI

struct Biblioteca: View {
    @StateObject var viewModel : ClaseViewModel
    var body: some View {
        NavigationView{
            List{
                ForEach(
                    viewModel.librosDB.sorted(by: viewModel.almacen.displayOrder.predicate())){libro in
                    
                    if viewModel.shouldShowItem(libro: libro) {
                        BasicImageRow(libro: libro)
                            .contextMenu {
                                Button(action: {
                                    // mark the selected restaurant as check-in
                                    viewModel.checkIn(libro: libro)
                                    viewModel.fetchLibros()
                                }) {
                                    HStack {
                                        Text("Check-in")
                                        Image(systemName: "checkmark.seal.fill")
                                    }
                                }
                                Button(action: {
                                    // delete the selected restaurant
                                    viewModel.delete(restaurant: restaurant)
                                    viewModel.fetchRestaurants()
                                    
                                }) {
                                    HStack {
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                }
                                Button(action: {
                                    // mark the selected restaurant as favorite
                                    viewModel.setFavorite(restaurant: restaurant)
                                    viewModel.fetchRestaurants()
                                    
                                }) {
                                    HStack {
                                        Text("Favorite")
                                        Image(systemName: "star")
                                    }
                                }
                            }
                            .onTapGesture {
                                viewModel.selectedLibro = libro
                            }
                        }
                    }
               /* .onDelete { (indexSet) in
                    viewModel.libros.remove(atOffsets: indexSet)
                }*/
            }
            
            .navigationBarTitle("Biblioteca")
            
            //PARA CREAR EL BOTÓN DE LA VISTA SETTINGS
            .navigationBarItems(trailing:
                HStack{
                    Button(action: {
                    viewModel.showSettings = true
                    }, label: {
                        Image(systemName: "gear").font(.title)
                            .foregroundColor(.black)
                        }
                    )
                    Button ("SignOut") {
                   // authViewModel.signOut()
                    }
                }
            )
           /* .sheet(isPresented: $viewModel.showSettings) {
                SettingView().environmentObject(viewModel.almacen)
            }   */
            
        }
        
    }
}

/*struct Biblioteca_Previews: PreviewProvider {
    static var previews: some View {
        Biblioteca()
    }
}*/
