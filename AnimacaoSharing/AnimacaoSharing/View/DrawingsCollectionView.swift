//
//  CollectionViewDrawings.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

extension DrawingsViewController: UICollectionViewDelegate {

}

extension DrawingsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Animation.animations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                "BestDrawingsCollectionCell", for: indexPath) as? BestDrawingsCollectionViewCell else {
                        fatalError("DequeueReusableCell failed while casting")
                }
        cell.titleDrawingLabel.text = Animation.animations[indexPath.row].value(forKey: "Name") as? String
        cell.posterDrawingImagemView.load(imgUrl: Animation.animations[indexPath.row].value(forKey: "Poster") as! String)
        cell.layer.cornerRadius = 12
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailAnimationVC = storyboard?.instantiateViewController(withIdentifier: "detalheVC") as? DetailsViewController
        detailAnimationVC?.poster = Animation.animations[indexPath.row].value(forKey: "Poster") as? String
        detailAnimationVC?.name = Animation.animations[indexPath.row].value(forKey: "Name") as? String
        detailAnimationVC?.plotDescription = Animation.animations[indexPath.row].value(forKey: "Plot") as? String
        detailAnimationVC?.launchDate = Animation.animations[indexPath.row].value(forKey: "Year") as? String
        guard let detailVC = detailAnimationVC else { return }
        self.navigationController?.showDetailViewController(detailVC, sender: self)
    }
}
