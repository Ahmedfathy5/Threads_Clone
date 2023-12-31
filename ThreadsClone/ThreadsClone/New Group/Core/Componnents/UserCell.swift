//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 05/11/2023.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView(user: user ,size:  .small)
                VStack(alignment: .leading , spacing: 2) {
                    Text(user.userName)
                        .fontWeight(.semibold)
                    
                    Text(user.fullName)
                }
                .font(.footnote)
                Spacer()
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4) ,lineWidth: 1)
                    )
            }
            .padding(.horizontal)
            Divider()
        }
        .padding(.vertical , 4)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
