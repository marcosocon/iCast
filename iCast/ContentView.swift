//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Marcos Ocon on 15/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State var podcasts: [Podcast] = []
    var body: some View {
        NavigationView {
            TabView {
                PodcastsScreen(podcasts: self.podcasts).tabItem {
                    Image(systemName: "book")
                    Text("Podcasts")
                }
                Text("New Releases").tabItem {
                    Image(systemName: "heart.circle")
                    Text("Favorites")
                    
                }
                Text("Settings").tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                    
                }.animation(.easeIn)

            }
        }.onAppear(perform: {
            print("x runn")
            Api().getPodcasts { (podcasts) in
                self.podcasts = podcasts!
            }
            
            //Do action on appear
        })
    }
}

// Podcasts Screen Page
struct PodcastsScreen: View {
    var podcasts: [Podcast]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Good Morning, Marcos")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                PodcastGroup(title: "Trending Now", podcasts: self.podcasts)
                PodcastGroup(title: "Most Popular", podcasts: self.podcasts)
                PodcastGroup(title: "Selected For You", podcasts: self.podcasts)
                Spacer()
            }.padding(.leading)
        }
    }
}

// Podcast Group Component
// @param title : String
struct PodcastGroup: View {
    var title: String
    var podcasts: [Podcast]
    var body: some View {
        Text(title).font(.title)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(podcasts) { podcast in
                    PodcastItem(podcast: podcast)
                }
            }
        }
    }
}

// Podcast Item Component
struct PodcastItem: View {
    var podcast: Podcast
    var body: some View {
        NavigationLink(destination: PodcastDetailScreen()) {
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

// Podcast Detail Page
struct PodcastDetailScreen: View {
    var body: some View {
        Text("Detail View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
