//
//  Api.swift
//  MusicPlayer
//
//  Created by Marcos Ocon on 24/10/2020.
//

import SwiftUI

struct Podcast: Decodable, Identifiable {
    var description_highlighted: String
    var description_original: String
    var earliest_pub_date_ms: Int
    var email: String
    var explicit_content: Bool
    var genre_ids: Array<Int>
    var id: String
    var image: String
    var itunes_id: Int
    var latest_pub_date_ms: Int
    var listennotes_url: String
    var publisher_highlighted: String
    var publisher_original: String
    var rss: String
    var thumbnail: String
    var title_highlighted: String
    var title_original: String
    var total_episodes: Int
    var website: String
}

struct SearchPodcastsResponse: Decodable {
    var count: Int
    var next_offset: Int
    var results: Array<Podcast>
    var took: Float
    var total: Int
}

class Api {
    func getPodcasts(completion: @escaping ([Podcast]?) -> ()) {
        guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/search?q=the%20groun&sort_by_date=0&type=podcast") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
          "Content-Type": "application/json",
          "X-ListenAPI-Key": "ac3b5347a0dc43b1965f55d187a2a134"
        ]
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let response = try! JSONDecoder().decode(SearchPodcastsResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(response.results)
            }
            
        }.resume()
    }
}



