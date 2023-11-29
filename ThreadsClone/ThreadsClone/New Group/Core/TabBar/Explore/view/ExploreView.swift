//
//  ExploreVoew.swift
//  ThreadsClone
//
//  Created by Ahmed Fathi on 02/11/2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var SearchText = ""
    @StateObject var viewModel = ExploreViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users ) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .searchable(text: $SearchText, prompt: "Search")
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct ExploreVoew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExploreView()
        }
    }
}
