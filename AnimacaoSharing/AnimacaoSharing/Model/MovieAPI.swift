//
//  Movie.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 22/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation

struct MovieAPI: Codable {
    let imdbID,
        title,
        rated,
        released,
        director,
        plot,
        year,
        imdbRating,
        poster,
        type: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case rated  = "Rated"
        case year = "Year"
        case plot = "Plot"
        case released = "Released"
        case director = "Director"
        case poster = "Poster"
        case type = "Type"
        case imdbRating, imdbID
    }
}
