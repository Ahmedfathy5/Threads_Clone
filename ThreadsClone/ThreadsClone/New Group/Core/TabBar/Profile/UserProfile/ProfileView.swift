//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 02/11/2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    
    
    var body: some View {
        ScrollView (showsIndicators: false){
            
            VStack(spacing: 20.0) {
                ProfileHrederView(user: user)
                    .padding(.horizontal)
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                //User content list view
                UserContentListView(user: user)
            }
            
        }
        .navigationBarTitleDisplayMode(.inline )
        .padding(.horizontal)
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
