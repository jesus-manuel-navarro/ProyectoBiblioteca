//
//  ForgotPasswordView.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 8/5/24.
//

import Foundation
import SwiftUI

struct ForgotPasswordView: View {
    @State private var emailAddress: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode

       var body: some View {
           NavigationView {
               Form {
                   Section {
                       TextField("Email", text: $emailAddress)
                           .textContentType(.emailAddress)

                           //.textInputAutocapitalization(.never)
                           .keyboardType(.emailAddress)

                   }
                   Section(footer: Text("Once sent, check your email to reset your password.")) {
                       Button(action: {
                           authViewModel.resetPassword(emailAddress: emailAddress)

                       }) {
                        Text("Send email link")
                               .bold()
                        }
                    }

                }
                       .navigationTitle("Reset password")
                       .toolbar {
                           ToolbarItemGroup(placement: .confirmationAction) {
                               Button("Done") {
                                   presentationMode.wrappedValue.dismiss()
                               }

                           }

                       }

           }

       }

   }



   struct ForgotPasswordView_Previews: PreviewProvider {
       static var previews: some View {
           ForgotPasswordView()
       }
   }
