//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 09/11/2023.
//

import SwiftUI
import Firebase



class DeveloperPreView {
    
    static let shared = DeveloperPreView()
    
    let user = User(id: NSUUID().uuidString, fullName: "aaa", email: "aa", userName: "aaa")
    let thread = Thread(ownerUid: "123", caption: "123", timestamp: Timestamp(), likes: 0)
    
}


extension PreviewProvider {
    static var dev : DeveloperPreView {
        return DeveloperPreView.shared
    }
    
    
}
