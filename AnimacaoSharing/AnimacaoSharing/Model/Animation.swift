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

    static func createAnimation (movie: MovieAPI, userRating: String) -> Animation {
        let container = CKContainer.init(identifier: "iCloud.ChallengeFalcetes")
        let dataBase = container.privateCloudDatabase

        let newAnimation = Animation(movie.title, movie.year, movie.plot, movie.imdbRating, userRating, movie.poster, movie.type)

        let animation = CKRecord(recordType: "Animation")

        animation.setValue(newAnimation.title, forKey: "Name")
        animation.setValue(newAnimation.userRating, forKey: "Note")
        animation.setValue(newAnimation.plot, forKey: "Plot")
        animation.setValue(newAnimation.year, forKey: "Year")
        animation.setValue(newAnimation.poster, forKey: "Poster")
        animation.setValue(newAnimation.type, forKey: "Type")

        dataBase.save(animation) { (_, error) in
            if let erro = error {
                fatalError(erro.localizedDescription)
            } else {
                print("sucesso")
            }
        }
        return newAnimation
    }
}
