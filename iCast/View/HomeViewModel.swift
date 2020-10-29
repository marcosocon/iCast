//
//  HomeViewModel.swift
//  iCast
//
//  Created by Marcos Ocon on 29/10/2020.
//

import Foundation

final class PodcastsScreenViewModel: ObservableObject {
    @Published var podcasts: [Podcast] = []
}
