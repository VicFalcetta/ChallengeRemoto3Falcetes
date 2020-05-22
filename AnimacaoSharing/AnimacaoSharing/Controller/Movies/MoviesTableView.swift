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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GaleryMovieTableViewCell", for: indexPath) as! GaleryMovieTableViewCell
        cell.nameMovieLabel.text = arrayOfGalleryMovies[indexPath.row]
        return cell
    }
}
