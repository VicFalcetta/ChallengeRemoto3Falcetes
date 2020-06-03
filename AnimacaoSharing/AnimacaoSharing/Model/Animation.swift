//
//  Animation.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 25/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import Foundation
import CloudKit

struct Animation {
    let title, year, plot, rating, userRating, poster, type: String
    init(_ title: String, _ year: String, _ plot: String,
         _ rating: String, _ userRating: String, _ poster: String, _ type: String) {
        self.title = title
        self.year = year
        self.plot = plot
        self.rating = rating
        self.userRating = userRating
        self.poster = poster
        self.type = type
    }

    static var animations = [CKRecord]()

    static var database = CKContainer.default().privateCloudDatabase

    static func createAnimation(movie: MovieAPI, userRating: String) -> Animation {

        let newAnimation = Animation(movie.title, movie.year, movie.plot, movie.imdbRating, userRating, movie.poster, movie.type)

        var animation: CKRecord
        if newAnimation.type == "movie" {
        animation = CKRecord(recordType: "Animation")
        } else {
            animation = CKRecord(recordType: "Drawing")
        }
        animation.setValue(newAnimation.title, forKey: "Name")
        animation.setValue(newAnimation.userRating, forKey: "Note")
        animation.setValue(newAnimation.plot, forKey: "Plot")
        animation.setValue(newAnimation.year, forKey: "Year")
        animation.setValue(newAnimation.poster, forKey: "Poster")
        animation.setValue(newAnimation.type, forKey: "Type")

        database.save(animation) { (_, error) in
            if let erro = error {
                fatalError(erro.localizedDescription)
            } else {
                print("sucesso")
            }
        }
        return newAnimation
    }
}
