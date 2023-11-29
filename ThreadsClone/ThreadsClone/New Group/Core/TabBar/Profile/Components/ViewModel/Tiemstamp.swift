//
//  Timestamp.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 14/11/2023.
//

import Foundation
import Firebase


extension Timestamp {
    func timestampString () -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second , .minute , .hour , .day , .weekOfMonth , .month]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue() , to: Date()) ?? ""
    }
}
