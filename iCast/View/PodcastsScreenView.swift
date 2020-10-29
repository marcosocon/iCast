//
//  PodcastsScreenView.swift
//  iCast
//
//  Created by Marcos Ocon on 28/10/2020.
//

import SwiftUI

// Podcasts Screen Page
struct PodcastsScreenView: View {
    var podcasts: [Podcast]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Good Morning, Marcos")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                PodcastGroupView(title: "Trending Now", podcasts: self.podcasts)
                PodcastGroupView(title: "Most Popular", podcasts: self.podcasts)
                PodcastGroupView(title: "Selected For You", podcasts: self.podcasts)
                Spacer()
            }.padding(.leading)
        }
    }
}
