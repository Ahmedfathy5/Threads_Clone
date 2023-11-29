//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 09/11/2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        Task { try await fetchUsers()}
    }
    @MainActor
    private func fetchUsers() async throws {
        
        self.users = try await UserService.fetchUsers()
    }
}
