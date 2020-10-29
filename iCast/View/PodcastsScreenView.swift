//
//  PodcastsScreenView.swift
//  iCast
//
//  Created by Marcos Ocon on 28/10/2020.
//

import SwiftUI

// Podcasts Screen Page
struct PodcastsScreenView: View {
    @ObservedObject var viewModel = PodcastsScreenViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Good Morning, Marcos")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                PodcastGroupView(title: "Trending Now", podcasts: viewModel.podcasts)
                PodcastGroupView(title: "Most Popular", podcasts: viewModel.podcasts)
                PodcastGroupView(title: "Selected For You", podcasts: viewModel.podcasts)
                Spacer()
            }
            .padding(.leading)
        }.onAppear(perform: {
            Api().getPodcasts { (podcasts) in
                viewModel.podcasts = podcasts!
            }
        })
    }
}
