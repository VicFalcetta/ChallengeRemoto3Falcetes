//
//  CollectionViewMovies.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

extension MoviesViewController: UICollectionViewDelegate {

}

extension MoviesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfBestMovies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                "BestMoviesCollectionCell", for: indexPath) as! BestMoviesCollectionViewCell
        cell.titleMovieLabel.text = arrayOfBestMovies[indexPath.row]
        return cell
    }
}
