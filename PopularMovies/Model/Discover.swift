//
//  Discover.swift
//  PopularMovies
//
//  Created by Thais Gon on 16/04/22.
//

import SwiftUI

struct Discover: Decodable {
    let results: [Movie]
}

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String?
    let poster_path: String
    let vote_average: Float
}
