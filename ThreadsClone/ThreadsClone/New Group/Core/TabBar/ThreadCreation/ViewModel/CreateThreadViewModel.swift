//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 12/11/2023.
//

import Firebase


class CreateThreadViewModel : ObservableObject {
    @Published var caption = ""
    func uploadeThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let thread = Thread( ownerUid: uid, caption: caption, timestamp:  Timestamp(), likes: 0)
       try await ThreadService.uploadThread(thread)
    }
}
