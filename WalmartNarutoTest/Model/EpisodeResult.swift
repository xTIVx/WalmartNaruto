//
//  EpisodeResult.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/27/21.
//

import Foundation


struct EpisodeResult: Codable {
    var results: [Anime]?
}

struct Anime: Codable {
    var image_url: String?
    var title: String?
    var synopsis: String?
    var score: Double?
    var start_date: String?
    var end_date: String?
}
