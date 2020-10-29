//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Marcos Ocon on 15/10/2020.
//

import SwiftUI

struct HomeView: View {
    @State var podcasts: [Podcast] = []
    var body: some View {
        NavigationView {
            TabView {
                PodcastsScreenView(podcasts: self.podcasts).tabItem {
                    Image(systemName: "book")
                    Text("Podcasts")
                }
                Text("Favorites").tabItem {
                    Image(systemName: "heart.circle")
                    Text("Favorites")
                    
                }
                Text("Settings").tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                    
                }.animation(.easeIn)

            }
        }.onAppear(perform: {
            Api().getPodcasts { (podcasts) in
                self.podcasts = podcasts!
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
