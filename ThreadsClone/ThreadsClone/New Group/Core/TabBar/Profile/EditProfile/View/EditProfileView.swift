//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 06/11/2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    @State private var bioText = ""
    @State private var linkTetxt = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()
                
                VStack {
                    //name and profile image
                    HStack {
                        VStack(spacing:10) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullName)
                            
                        }
                        
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    Divider()
                    
                    //bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter Your Bio", text: $bioText , axis: .vertical)
                    }
                    
                    Divider()
                    //link field
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add Link...", text: $linkTetxt , axis: .vertical)
                    }
                    
                    Divider()
                    Toggle("Private Profile" , isOn: $isPrivateProfile)
                    
                    
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(15)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4) , lineWidth: 1 )
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
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
                    Button {
                        Task{ try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: dev.user)
    }
}
