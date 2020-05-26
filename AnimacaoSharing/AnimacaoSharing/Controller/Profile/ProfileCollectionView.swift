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
        guard let cellWatchMovie = collectionView.dequeueReusableCell(withReuseIdentifier:
                "AssistedMoviesCollectionCell", for: indexPath) as? WatchedMoviesCollectionViewCell else {
                        fatalError("DequeueReusableCell failed while casting")
                }
            cellWatchMovie.titleWatchMovieLabel.text = arrayOfWatchedMovies[indexPath.row]
            return cellWatchMovie
        } else {
       guard let cellWatchDrawing = collectionView.dequeueReusableCell(withReuseIdentifier:
            "AssistedMoviesCollectionCell", for: indexPath) as? WatchedDrawingCollectionViewCell else {
                    fatalError("DequeueReusableCell failed while casting")
            }
        cellWatchDrawing.titleWatchDrawingLabel.text = arrayOfWatchedDrawing[indexPath.row]
         return cellWatchDrawing
        }
    }
}
