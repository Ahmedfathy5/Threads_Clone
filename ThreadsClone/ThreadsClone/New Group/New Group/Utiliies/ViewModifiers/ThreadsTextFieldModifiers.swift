//
//  ThreadsTextFieldModifiers.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 01/11/2023.
//

import SwiftUI

struct ThreadsTextFieldModifiers : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .padding(.horizontal, 24)
            .cornerRadius(10)
    }
}
