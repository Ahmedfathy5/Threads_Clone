//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 12/11/2023.
//

import Foundation
import Firebase
import  FirebaseFirestoreSwift

struct ThreadService {
    static func uploadThread(_ thread: Thread)async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else {return}
         try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    static func fetchThread() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore()
            .collection("threads")
            .order(by: "timestamp" , descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
    }
    
    static func fetchUserThreads(uid : String ) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").whereField("ownerUid", isEqualTo: uid ).getDocuments()
        
        
   let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
        return threads.sorted(by: {$0.timestamp.dateValue() >  $1.timestamp.dateValue()   })
    }
}
