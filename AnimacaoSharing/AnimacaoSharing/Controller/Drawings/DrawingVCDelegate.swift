//
//  DrawingVCDelegate.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 04/06/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

protocol DrawingsVCDelegate: AnyObject {
    func addDrawing(_ drawing: Animation)
}

extension DrawingsViewController: DrawingsVCDelegate {
    func addDrawing(_ drawing: Animation) {
        self.galleryDrawingTableView.reloadData()
        self.bestDrawingsCollectionView.reloadData()
    }
}
