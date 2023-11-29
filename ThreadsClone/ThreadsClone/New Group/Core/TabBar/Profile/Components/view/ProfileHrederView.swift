//
//  ProfileHrederView.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 10/11/2023.
//

import SwiftUI

struct ProfileHrederView: View {
    var user: User?
    init(user: User?) {
        self.user = user
    }
    
    
    var body: some View {
        HStack (alignment: .top){
            // bio and status
            VStack(alignment: .leading, spacing:12) {
                //Full name and user name
                VStack(alignment: .leading, spacing:4) {
                    Text(user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.userName ?? "")
                        .font(.subheadline)
                }
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote )
                }
                
                
                Text("1000M followers")
                    .font(.caption.bold())
                    .foregroundColor(.gray)
                
            }
            Spacer()
            CircularProfileImageView(user: user ,size: .medium)
        }
    }
}

struct ProfileHrederView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHrederView(user: dev.user)
    }
}
