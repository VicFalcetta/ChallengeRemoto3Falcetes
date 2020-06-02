//
//  TableViewDrawings.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

extension DrawingsViewController: UITableViewDelegate {

}
extension DrawingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfGalleryDrawings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            "GalleryDrawingsTableViewCell", for: indexPath) as? GalleryDrawingsTableViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }
        cell.nameDrawingsLabel.text = arrayOfGalleryDrawings[indexPath.row].title
        cell.noteDrawingsLabel.text = "\(arrayOfGalleryDrawings[indexPath.row].userRating)/10"
        cell.posterDrawingsImageView.load(imgUrl: arrayOfGalleryDrawings[indexPath.row].poster)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAnimationVC = storyboard?.instantiateViewController(withIdentifier: "detalheVC") as? DetailsViewController
        detailAnimationVC?.poster = arrayOfGalleryDrawings[indexPath.row].poster
        detailAnimationVC?.name = arrayOfGalleryDrawings[indexPath.row].title
        detailAnimationVC?.plotDescription = arrayOfGalleryDrawings[indexPath.row].plot
        detailAnimationVC?.launchDate = arrayOfGalleryDrawings[indexPath.row].year
        guard let detailVC = detailAnimationVC else { return }
        self.navigationController?.showDetailViewController(detailVC, sender: self)
    }
}
