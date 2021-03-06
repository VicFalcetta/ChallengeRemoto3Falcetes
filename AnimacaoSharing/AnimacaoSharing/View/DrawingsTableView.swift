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
        Animation.animations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            "GalleryDrawingsTableViewCell", for: indexPath) as? GalleryDrawingsTableViewCell else {
                fatalError("DequeueReusableCell failed while casting")
        }
        cell.nameDrawingsLabel.text = Animation.animations[indexPath.row].value(forKey: "Name") as? String
        cell.noteDrawingsLabel.text = "\(Animation.animations[indexPath.row].value(forKey: "Note") as? String ?? "0")/10"
        cell.posterDrawingsImageView.load(imgUrl: Animation.animations[indexPath.row].value(forKey: "Poster") as! String)
        cell.posterDrawingsImageView.layer.cornerRadius = (cell.posterDrawingsImageView.frame.size.height)/2
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
