//
//  ProfileModel.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 08/11/2023.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI


class CurrentUserProfileViewModel : ObservableObject {
    @Published var currentUser: User?
    
    private var cancelabels = Set<AnyCancellable>()
    init(){
        setupSuscribers()
    }
    
    private func setupSuscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            
        }
        .store(in: &cancelabels)
    }
    
    
    
}



