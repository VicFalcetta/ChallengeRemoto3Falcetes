//
//  SearchBarMovies.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

extension MoviesViewController: UITableViewDelegate {

}

extension MoviesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfGalleryMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryMovieTableViewCell", for: indexPath) as! GalleryMovieTableViewCell
        cell.nameMovieLabel.text = arrayOfGalleryMovies[indexPath.row].title
        cell.noteMovieLabel.text = "\(arrayOfGalleryMovies[indexPath.row].userRating)/10"
        cell.posterMovieImageView.load(imgUrl: arrayOfGalleryMovies[indexPath.row].poster)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAnimationVC = storyboard?.instantiateViewController(withIdentifier: "detalheVC") as? DetailsViewController
        detailAnimationVC?.poster = arrayOfGalleryMovies[indexPath.row].poster
        detailAnimationVC?.name = arrayOfGalleryMovies[indexPath.row].title
        detailAnimationVC?.plotDescription = arrayOfGalleryMovies[indexPath.row].plot
        detailAnimationVC?.launchDate = arrayOfGalleryMovies[indexPath.row].year
        guard let detailVC = detailAnimationVC else { return }
        self.navigationController?.showDetailViewController(detailVC, sender: self)
    }
}
