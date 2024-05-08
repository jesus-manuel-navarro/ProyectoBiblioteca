//
//  Application_utility.swift
//  ProyectoBiblioteca
//
//  Created by abarbera on 8/5/24.
//

//Clase para implementar una Vista de UI para ver los pasos de login con Google,

import Foundation
import SwiftUI
import UIKit

final class Application_utility{
    
    static var rootViewController:UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        return root
    }
}

