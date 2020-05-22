//
//  Search.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 22/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation

struct Search: Codable {
    let movies: [Movie]
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case response = "Response"
    }
}
