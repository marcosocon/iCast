//
//  PodcastDetailView.swift
//  iCast
//
//  Created by Marcos Ocon on 28/10/2020.
//

import SwiftUI

// Podcast Detail Page
struct PodcastDetailView: View {
    
    var podcast: Podcast
    var body: some View {
        VStack {
            Text(podcast.title_original).font(.title)
            UrlImageView(urlString: podcast.thumbnail)
            HStack {
                Button("Play", action: {
                    
                })
                Button("Pause", action: {
                    
                })

            }
        }.padding()
    }
}

struct PodcastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastDetailView(podcast: Podcast(description_highlighted: "Highlighted", description_original: "Descriptio Original", earliest_pub_date_ms: 1, email: "na@asd.com", explicit_content: true, genre_ids: [], id: "asda", image: "asdasd", itunes_id: 2, latest_pub_date_ms: 2, listennotes_url: "asdasd", publisher_highlighted: "asdasd", publisher_original: "asdasd", rss: "asdasd", thumbnail: "asdasd", title_highlighted: "asdasd", title_original: "asdas", total_episodes: 3, website: "asdasd.com"))
    }
}
