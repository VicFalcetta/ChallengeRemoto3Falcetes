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
        return Animation.animations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            "GalleryMovieTableViewCell", for: indexPath) as? GalleryMovieTableViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }
        cell.nameMovieLabel.text = Animation.animations[indexPath.row].value(forKey: "Name") as? String
        cell.noteMovieLabel.text = "\(Animation.animations[indexPath.row].value(forKey: "Note") as? String ?? "0")/10"

        cell.posterMovieImageView.load(imgUrl: Animation.animations[indexPath.row].value(forKey: "Poster") as! String)
        cell.posterMovieImageView.layer.cornerRadius = (cell.posterMovieImageView.frame.size.height)/2
        cell.layer.cornerRadius = 12
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAnimationVC = storyboard?.instantiateViewController(withIdentifier: "detalheVC") as? DetailsViewController
        detailAnimationVC?.poster = Animation.animations[indexPath.row].value(forKey: "Poster") as? String
        detailAnimationVC?.name = Animation.animations[indexPath.row].value(forKey: "Name") as? String
        detailAnimationVC?.plotDescription = Animation.animations[indexPath.row].value(forKey: "Plot") as? String
        detailAnimationVC?.launchDate = Animation.animations[indexPath.row].value(forKey: "Year") as? String
        guard let detailVC = detailAnimationVC else { return }
        self.navigationController?.showDetailViewController(detailVC, sender: self)
    }
}
