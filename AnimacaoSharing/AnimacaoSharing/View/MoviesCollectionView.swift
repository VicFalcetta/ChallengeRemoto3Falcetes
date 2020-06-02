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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            "BestMoviesCollectionCell", for: indexPath) as? BestMoviesCollectionViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }
        cell.titleMovieLabel.text = arrayOfBestMovies[indexPath.row].title
        cell.posterMovieImagemView.load(imgUrl: "\(arrayOfBestMovies[indexPath.row].poster)")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailAnimationVC = storyboard?.instantiateViewController(withIdentifier: "detalheVC") as? DetailsViewController
        detailAnimationVC?.poster = arrayOfGalleryMovies[indexPath.row].poster
        detailAnimationVC?.name = arrayOfGalleryMovies[indexPath.row].title
        detailAnimationVC?.plotDescription = arrayOfGalleryMovies[indexPath.row].plot
        detailAnimationVC?.launchDate = arrayOfGalleryMovies[indexPath.row].year
        guard let detailVC = detailAnimationVC else { return }
        self.navigationController?.showDetailViewController(detailVC, sender: self)
    }
}
