//
//  RegisterView.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 01/11/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterationViewModel()
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Image("threads-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            VStack (spacing: 15){
                TextField("Enter your Full Name", text: $viewModel.fullName)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your User Name", text: $viewModel.UserName)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your Email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldModifiers())
                SecureField("Enter your Password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifiers())
            }
            Button {
                Task { try await viewModel.createUser() }
                
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 352, height: 44)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            Spacer()
            Divider()
            Button {
                dismiss()
            } label: {
                HStack (spacing: 5) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }
                
                .foregroundColor(.black)
            }
            .padding(.vertical,16)
            
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
