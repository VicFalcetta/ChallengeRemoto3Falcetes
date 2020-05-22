//
//  Movie.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 22/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let imdbID, title, year, poster: String
    let type: TypeEnum
    
    enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
}
