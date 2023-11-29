//
//  User.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 08/11/2023.
//

import Foundation

struct User : Identifiable , Codable , Hashable{
    let id : String
    let fullName : String
    let email : String
    let userName : String
    var profileImageUrl : String?
    var bio: String?
}
