//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 07/11/2023.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    func loginUser () async throws{
        
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
