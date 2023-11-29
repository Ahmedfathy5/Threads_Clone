//
//  ProfileTreadFilter.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 05/11/2023.
//

import Foundation


enum ProfileThreadFilter : Int, CaseIterable ,Identifiable {
    var id: Int {return rawValue}
    
    case threads
    case replies
    
    var title : String {
        
        switch self {
        case .replies :
            return "Replies"
        case .threads :
            return "Threads"
        }
    }
    
}
