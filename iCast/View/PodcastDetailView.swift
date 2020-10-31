//
//  PodcastDetailView.swift
//  iCast
//
//  Created by Marcos Ocon on 28/10/2020.
//

import SwiftUI
import AVFoundation

// Podcast Detail Page
struct PodcastDetailView: View {
    @State var episodes: [Episode] = []
    
    var podcast: Podcast
    var body: some View {
        NavigationView {
            VStack {
                Text(podcast.title_original).font(.title)
                UrlImageView(urlString: podcast.thumbnail)

                ForEach(episodes) { episode in
                    EpisodeListItem(episode: episode)
                }

            }.padding()
        }.onAppear(perform: {
            Api().getEpisodesForPodcast(id: podcast.id) { (episodes) in
                self.episodes = episodes!
            }
        })
    }
}

struct EpisodeListItem: View {
    var episode: Episode
    var body: some View {
        HStack {
            Text(episode.title)
            Button("Play", action: {
                print("Click on play")
            })
        }
    }
}

struct PodcastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastDetailView(podcast: Podcast(description_highlighted: "Highlighted", description_original: "Descriptio Original", earliest_pub_date_ms: 1, email: "na@asd.com", explicit_content: true, genre_ids: [], id: "asda", image: "asdasd", itunes_id: 2, latest_pub_date_ms: 2, listennotes_url: "asdasd", publisher_highlighted: "asdasd", publisher_original: "asdasd", rss: "asdasd", thumbnail: "asdasd", title_highlighted: "asdasd", title_original: "asdas", total_episodes: 3, website: "asdasd.com"))
    }
}
