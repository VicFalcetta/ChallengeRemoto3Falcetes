//
//  MoviesVCDelegate.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 25/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

protocol MoviesVCDelegate: AnyObject {
    func addMovie (_ movie: Animation)
}

extension MoviesViewController: MoviesVCDelegate {
    func addMovie(_ movie: Animation) {
        self.arrayOfGalleryMovies.append(movie)
        self.galleryMoviesTableView.reloadData()
    }
}
