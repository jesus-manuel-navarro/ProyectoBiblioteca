//
//  Login.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 7/5/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct SignUpView: View {
    @ObservedObject private var authModel = AuthViewModel()
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var showingSheet:Bool = false
    
    var body: some View {
        NavigationView {
                   Form {
                       Section {
                           TextField("Email", text: $emailAddress)
                               .textContentType(.emailAddress)
                               .keyboardType(.emailAddress)
                           SecureField("Password", text: $password)
                       }
                       Section {
                           Button(action: {
                               // Sign Up to Firebase
                               authModel.signUp(emailAddress: emailAddress, password: password)  }) {                               Text("Sign Up").bold()
                                }
                            }
                       Section(header: Text("Si ya tienes una cuenta:")) {
                                Button(action: {
                                // Sign In to Firebase
                                authModel.signIn(emailAddress:emailAddress,password: password)
                                }) {
                                    Text("Sign In")
                                    }
                            }
                       Section(header: Text("Entrar con Google")) {
                                Button(action: {
                               // Sign In to Firebase
                                authModel.signIn(emailAddress:emailAddress,password: password)
                                }) {
                                    HStack {
                                        Image("google")
                                            .resizable()
                                            .frame(width:40)
                                            
                                        Text("Entrar con Google")
                                        }
                                }
                            }                        }.navigationTitle("¡Bienvenido")
                            .toolbar {ToolbarItemGroup(placement:
                                    .cancellationAction) {
                                        Button {
                                            showingSheet.toggle()
                                        } label: {
                                            Text("Olvidaste tu contraseña?")
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                            ForgotPasswordView()
                                        }
                                    }
                            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
