//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 01/11/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("threads-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                VStack (spacing: 15){
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifiers())
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifiers())
                }
                
                
                NavigationLink {
                    //the distination
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .padding(.trailing , 28)
                        .frame(maxWidth: .infinity , alignment: .trailing)
                }
                
                Button {
                    Task {try await viewModel.loginUser()}
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 352, height: 44)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(8)
                }
                Spacer()
                Divider()
                NavigationLink {
                    //the distination
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack (spacing: 5) {
                        Text("Don't have an account?")
                        Text("SignUp")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
