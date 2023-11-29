//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 07/11/2023.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init () {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String ) async throws {
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print(error.localizedDescription )
        }
        
    }
    
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String , UserName: String ) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadeUserData(withEmail: email, fullName: fullName, userName: UserName, id: result.user.uid )
        } catch {
            print(error.localizedDescription )
        }
    }
    
    func sinOut(){
        try? Auth.auth().signOut() //sign out on Backend
        self.userSession = nil // this remove session locally and updates routing
        UserService.shared.reset() // sets current user to nil
    }
    @MainActor
    private func uploadeUserData(withEmail email: String, fullName: String , userName: String , id: String)async throws {
        let user = User(id: id, fullName: fullName, email: email, userName: userName)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
}
