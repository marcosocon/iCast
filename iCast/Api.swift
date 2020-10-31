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

struct Episode: Decodable, Identifiable {
    var id: String
    var link: String
    var audio: String
    var image: String
    var title: String
    var thumbnail: String
    var description: String
    var pub_date_ms: Int
    var listennotes_url:String
    var audio_length_sec:Int
    var explicit_content:Bool
    var maybe_audio_invalid:Bool
    var listennotes_edit_url: String
}

struct GetPodcastsResponse: Decodable {
    var count: Int
    var next_offset: Int
    var results: Array<Podcast>
    var took: Float
    var total: Int
}

struct GetEpisodesResponse: Decodable {
    var id: String
    var title: String
    var episodes: Array<Episode>
}

class Api {
    private var headers  = [
        "Content-Type": "application/json",
        "X-ListenAPI-Key": "ac3b5347a0dc43b1965f55d187a2a134"
      ]
    func getPodcasts(completion: @escaping ([Podcast]?) -> ()) {
        guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/search?q=the%20groun&sort_by_date=0&type=podcast") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let response = try! JSONDecoder().decode(GetPodcastsResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(response.results)
            }
        }.resume()
    }
    
    func getEpisodesForPodcast(id: String, completion: @escaping ([Episode]?) -> ()) {
        guard let url = URL(string: "https://listen-api.listennotes.com/api/v2/podcasts/" + id) else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let response = try! JSONDecoder().decode(GetEpisodesResponse.self, from: data!)
            print(response.episodes)
            DispatchQueue.main.async {
                completion(response.episodes)
            }
        }.resume()
    }
}



