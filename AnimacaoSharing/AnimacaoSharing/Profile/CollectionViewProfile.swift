//
//  CollectionViewProfile.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

extension ProfileViewController: UICollectionViewDelegate {
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.watchedMoviesCollectionView {
        return arrayOfWatchedMovies.count
        } else {
            return arrayOfWatchedDrawing.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.watchedMoviesCollectionView {
        let cellWatchMovie = collectionView.dequeueReusableCell(withReuseIdentifier: "AssistedMoviesCollectionCell", for: indexPath) as! WatchedMoviesCollectionViewCell
            cellWatchMovie.titleWatchMovieLabel.text = arrayOfWatchedMovies[indexPath.row]
            return cellWatchMovie
        } else {
       let cellWatchDrawing = collectionView.dequeueReusableCell(withReuseIdentifier: "AssistedMoviesCollectionCell", for: indexPath) as! WatchedDrawingCollectionViewCell
        cellWatchDrawing.titleWatchDrawingLabel.text = arrayOfWatchedDrawing[indexPath.row]
         return cellWatchDrawing
        }
    }
}
