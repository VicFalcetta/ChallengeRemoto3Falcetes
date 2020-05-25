//
//  Animation.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 25/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation

struct Animation {
    let title, year, plot, rating, userRating, poster: String
    init(_ title: String, _ year: String, _ plot: String,
         _ rating: String, _ userRating: String, _ poster: String) {
        self.title = title
        self.year = year
        self.plot = plot
        self.rating = rating
        self.userRating = userRating
        self.poster = poster
    }
    static func createAnimation (movie: MovieAPI, userRating: String) -> Animation {
        let newAnimation = Animation(movie.title, movie.year, movie.plot, movie.imdbRating, userRating, movie.poster)
        return newAnimation
    }
}
