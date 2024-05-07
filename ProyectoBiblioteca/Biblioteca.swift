//
//  SwiftUIView.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 6/5/24.
//

import SwiftUI

struct Biblioteca: View {
    
    @State var selectedLibro: Libro?
    var libros = [ Libro(titulo: "Los tres mosqueteros", image: "tresMosqueteros", autor: "Alejandro Dumas", genero: "Aventuras", sinopsis:"D'Artagnan, un joven gascón de familia noble venida a menos, parte a París para cumplir su sueño de convertirse en Mosquetero. Allí entabla una fuerte amistad con tres de ellos: Athos, Porthos y Aramis. Juntos se verán envueltos en todo tipo de peripecias, romances e intrigas políticas en contra del Cardenal Richelieu." ),
                     Libro(titulo: "El Tulipán Negro", image: "tulipanNegro", autor: "Alejandro Dumas", genero: "Aventuras", sinopsis: "El tulipán negro es un libro que nos relata la historia de un joven horticultor que comienza con la obsesión de encontrar el color negro en la flor más bonita de aquella época y todas las aventuras que tiene que atravesar para lograrlo."),
                   Libro(titulo: "La Isla", image: "laIsla", autor: "Aldoux Huxley", genero: "Fantástica", sinopsis: "En la utópica isla de Pali, en un imaginario Pacífico, el periodista Will Farnaby descubre una nueva religión, una nueva economía agrícola, una sorprendente biología experimental y un extraordinario amor a la vida."),
                   Libro(titulo: "La Peste", image: "laPeste", autor: "Albert Camus", genero: "Novela histórica", sinopsis: "Publicada en el 10 de junio de 1947, cuenta la historia de unos doctores que descubren el sentido de la solidaridad en su labor humanitaria en la ciudad argelina de Orán, mientras esta es azotada por una epidemia de peste."),
                   Libro(titulo: "El conde de Montecristo", image: "condeMontecristo", autor: "Alejandro Dumas", genero: "Novela histórica", sinopsis: "La novela narra la vida de Edmundo Dantés desde que fue apresado injustamente en el castillo de If por un falso cargo de traición, hasta que regresa años después, convertido en el Conde de Montecristo, para ejercer su venganza sobre aquellos que destruyeron su vida.")]
    
    var body: some View {
       
        VStack {
            Text("Mi Biblioteca")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            NavigationView {
                List {
                    ForEach(libros) { libro in
                        NavigationLink(destination:DetalleLibro(libro: libro)){
                            MostrarEnListView(libro: libro)
                                .onTapGesture{
                                    self.selectedLibro = libro
                                    DetalleLibro(libro:libro)
                                }
                        }
                    }
                                   
                }
                .navigationBarTitle(" .. ")
                .navigationBarHidden(true)
            }
        }
        
    }
}

struct Biblioteca_Previews: PreviewProvider {
    static var previews: some View {
        Biblioteca()
    }
}

/*struct LibroDetailView: View {
    var libro: Libro
    var body: some View {
        VStack {
            Text(libro.titulo)
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
}*/

struct Libro: Identifiable {
    var id = UUID()
    var titulo: String
    var image: String
    var autor: String
    var genero: String
    var sinopsis: String
}

struct MostrarEnListView: View {
    var libro: Libro
    var body: some View {
        HStack {
            Image(libro.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            VStack(alignment: .leading){
                Text(libro.titulo)
                Text("Autor: \(libro.autor)")
                Text("Género: \(libro.genero)")
            }
        }
    }
}

