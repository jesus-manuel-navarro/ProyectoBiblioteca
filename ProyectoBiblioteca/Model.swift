//
//  Model.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 6/5/24.
//

import Foundation
import SwiftUI

//import FirebaseFirestoreSwift

//añadimos la extensión Codable
struct Restaurant: Codable, Identifiable {
    //identificador único para firebase
    //@DocumentID var id:String?
    
    var id2 = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

struct BasicImageRow:  View {
  
    var libro: Libro
    
    var body: some View {
      
            HStack {
                Image(libro.image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(libro.name)
                            .font(.system(.body, design: .rounded))
                            .bold()
                        
                        Text(String(repeating: "$", count: libro.priceLevel))
                            .font(.subheadline)
                            .foregroundColor(.gray)

                    }
                    
                    Text(libro.type)
                        .font(.system(.subheadline, design: .rounded))
                        .bold()
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                    
                    Text(libro.phone)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                    .layoutPriority(-100)
                
                if libro.isCheckIn {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.red)
                }
                
                if libro.isFavorite {
                //  Spacer()
                    
                    Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                }
            }
        
    }
}
