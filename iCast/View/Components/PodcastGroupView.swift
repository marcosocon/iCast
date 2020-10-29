//
//  PodcastGroupView.swift
//  iCast
//
//  Created by Marcos Ocon on 28/10/2020.
//

import SwiftUI

// Podcast Group Component
// @param title : String
struct PodcastGroupView: View {
    var title: String
    var podcasts: [Podcast]
    var body: some View {
        Text(title).font(.title)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(podcasts) { podcast in
                    PodcastItemView(podcast: podcast)
                }
            }
        }
    }
}
