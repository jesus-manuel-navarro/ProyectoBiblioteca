//
//  ViewModel.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 6/5/24.
//

import Foundation
import SwiftUI
//import FirebaseFirestore

class ClaseViewModel:ObservableObject{
    @Published var selectedLibro: Libro?
    @Published var showSettings: Bool = false
    @Published var libro:[Libro] = []
    
    //para descargar la base de datos
    @Published var libroDB:[Restaurant] = []
    
   // @ObservedObject var almacen: SettingStore
  
    //private var databaseReference = Firestore.firestore().collection("restaurantes")
    

    //init(almacen:SettingStore){
       
        self.almacen = almacen
        
        checkIfDatabaseIsEmpty()
        
        self.libros = [
            Libro(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3),
            Libro(name: "Homei", type: "Cafe", phone: "348-233423", image: "homei", priceLevel: 3),
            Libro(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true),
            Libro(name: "Cafe loisl", type: "Austrian / Casual Drink", phone: "453-333423", image: "cafeloisl", priceLevel: 2, isFavorite: true, isCheckIn: true),
            Libro(name: "Petite Oyster", type: "French", phone: "983-284334", image: "petiteoyster", priceLevel: 5, isCheckIn: true),
            Libro(name: "For Kee Restaurant", type: "Hong Kong", phone: "232-434222", image: "forkeerestaurant", priceLevel: 2, isFavorite: true, isCheckIn: true),
            ]
    
    func checkIfDatabaseIsEmpty(){
        databaseReference.getDocuments{
            QuerySnapshot, error in
            if let error = error {
                print("Error gettin jgoduments: \(error)")
                return
            }
            guard let documents = QuerySnapshot?.documents else {
                print("No documentes found")
                return
            }
            if documents.isEmpty{
                self.addInitialRestaurants()
            } else {
                print("La seleccion no está vacia, no se agregaron elementos")
            }
            }
            
        }
    
    //Para aplicar filtros elegidos (quitar el private de la función)
 /* func shouldShowItem(libro: Libro) -> Bool {
        //si no ha pulsado visitados y está en el rango O(||) si lo ha pulsado y está en el rango
    return (!self.almacen.showCheckInOnly || restaurant.isCheckIn) && (restaurant.priceLevel <= self.almacen.maxPriceLevel)
    } */
    
    func addLibro(libro: Libro){
        do {
            _ = try databaseReference.addDocument(from: libro)
        } catch {
            print("Error adding libro \(error)")
        }
    }
    
    func delete(libro: Libro) {
        if let libroID = libro.id {
            databaseReference.document(libroID).delete {
                error in if let error = error{
                    print("Error removing document: \(error)")
                }
            }
        }
    }
    
    func setFavorite(libro: Libro) {
        if let libroID = libro.id {
            databaseReference.document(libroID).updateData(["isFavorite": !libro.isFavorite])
        }
    }
    
    func checkIn(libro: Libro) {
        if let restaurantID = restaurant.id {
            databaseReference.document(restaurantID).updateData(["isCheckIn": !restaurant.isCheckIn])
        }
    }
    
    func addInitialRestaurants(){
        
        for restaurant in restaurants {
            self.addRestaurant(restaurant: restaurant)
        }
    }
    
    func fetchRestaurants(){
        databaseReference.getDocuments{
            QuerySnapshot, error in
            if let error = error {
                print("Error de conexion: \(error)")
                return
            }
            guard let documents = QuerySnapshot?.documents else {
                print("No documentes found")
                return
            }
            if documents.isEmpty{
               //la colección está vacia
            } else {
                //la colección no está vacia, asignamos al array restaurants
                self.restaurantsDB = documents.compactMap {
                    document in
                    do {
                        let restaurant = try document.data(as: Restaurant.self)
                        return restaurant
                    } catch {
                        return nil
                    }
                    }
                }
            }
        
    }
        
}
