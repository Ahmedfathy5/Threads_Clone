//
//  ImageUploader.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 11/11/2023.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct ImageUploader {
    
    static func uploadeImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch  {
        //    Alert(title:Text("Faild to upload image with error\(error.localizedDescription)") , message: Text("النت مش مظبوط"))
            return nil
        }
        
    }
    
    
    
}


