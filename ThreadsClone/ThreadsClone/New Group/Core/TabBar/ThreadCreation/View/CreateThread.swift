//
//  CreateThread.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 02/11/2023.
//

import SwiftUI

struct CreateThread: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    private var user: User? {
        return UserService.shared.currentUser
    }
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user , size: .small)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.userName ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a Thred....", text:$viewModel.caption )
                    }
                    .font(.footnote)
                    Spacer()
                    if !viewModel.caption.isEmpty {
                        Button {
                            viewModel.caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thraed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        Task{
                            try await viewModel.uploadeThread()
                            dismiss()
                        }
                    }
                    .opacity(viewModel.caption.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    
                    
                }
            }
        }
    }
}

struct CreateThread_Previews: PreviewProvider {
    static var previews: some View {
        CreateThread()
    }
}
