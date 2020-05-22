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
        arrayOfDrawingsMovies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                "BestDrawingsCollectionCell", for: indexPath) as! BestDrawingsCollectionViewCell
        cell.titleDrawingLabel.text = arrayOfDrawingsMovies[indexPath.row]
        return cell
    }
}
