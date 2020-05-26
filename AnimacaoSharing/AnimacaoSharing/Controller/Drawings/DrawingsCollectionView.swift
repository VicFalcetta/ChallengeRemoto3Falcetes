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
        arrayOfBestDrawings.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                "BestDrawingsCollectionCell", for: indexPath) as! BestDrawingsCollectionViewCell
        cell.titleDrawingLabel.text = arrayOfBestDrawings[indexPath.row].title
        cell.posterDrawingImagemView.load(imgUrl: "\(arrayOfBestDrawings[indexPath.row].poster)")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailAnimationVC = storyboard?.instantiateViewController(withIdentifier: "detalheVC") as? DetailsViewController
        detailAnimationVC?.poster = arrayOfGalleryDrawings[indexPath.row].poster
        detailAnimationVC?.name = arrayOfGalleryDrawings[indexPath.row].title
        detailAnimationVC?.plotDescription = arrayOfGalleryDrawings[indexPath.row].plot
        detailAnimationVC?.launchDate = arrayOfGalleryDrawings[indexPath.row].year
        guard let detailVC = detailAnimationVC else { return }
        self.navigationController?.showDetailViewController(detailVC, sender: self)
    }
}
