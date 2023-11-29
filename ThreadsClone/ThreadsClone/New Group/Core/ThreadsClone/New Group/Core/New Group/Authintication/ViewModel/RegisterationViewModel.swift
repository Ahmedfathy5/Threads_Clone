//
//  RegisterationViewModel.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 07/11/2023.
//

import Foundation
class RegisterationViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var UserName = ""
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName, UserName: UserName)
    }
}
