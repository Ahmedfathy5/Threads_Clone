//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 07/11/2023.
//

import Foundation
import Firebase
import Combine


class ContentViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    private var cacelabells = Set<AnyCancellable>()
    
    init () {
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cacelabells)
    }
}

