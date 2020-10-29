//
//  PodcastItemView.swift
//  iCast
//
//  Created by Marcos Ocon on 28/10/2020.
//

import SwiftUI

// Podcast Item View Component
struct PodcastItemView: View {
    var podcast: Podcast
    var body: some View {
        NavigationLink(destination: PodcastDetailView(podcast: podcast)) {
            VStack() {
                UrlImageView(urlString: podcast.thumbnail)
                Text(podcast.title_original).font(.footnote)
            }
            .frame(width: 150, height: 170, alignment: .center)
            .padding(.top)
            .padding(.bottom)
        }
    }
}
