//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 05/11/2023.
//

import SwiftUI
import Kingfisher


enum ProfileImageSize {
    case small
    case medium
    
    
    var dimension: CGFloat {
        switch self {
        case .small: return 40
        case .medium: return 48
        }
    }
    
}
struct CircularProfileImageView: View {
    var user: User?
    var size : ProfileImageSize
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
        
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: dev.user, size: .medium)
    }
}
