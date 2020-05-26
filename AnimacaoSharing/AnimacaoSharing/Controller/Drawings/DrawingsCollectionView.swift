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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                "BestDrawingsCollectionCell", for: indexPath) as? BestDrawingsCollectionViewCell else {
                        fatalError("DequeueReusableCell failed while casting")
                }
        cell.titleDrawingLabel.text = arrayOfBestDrawings[indexPath.row].title
        cell.posterDrawingImagemView.load(imgUrl: "\(arrayOfBestDrawings[indexPath.row].poster)")
        return cell
    }
}
