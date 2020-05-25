//
//  DrawingsViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

protocol DrawingsVCDelegate: AnyObject {
    func addDrawing(_ drawing: Animation)
}
class DrawingsViewController: UIViewController {

    @IBOutlet weak var drawingSearchBar: UISearchBar!
    @IBOutlet weak var bestDrawingsCollectionView: UICollectionView!
    @IBOutlet weak var galleryDrawingTableView: UITableView!
    var arrayOfBestDrawings: [Animation] = []
    var arrayOfGalleryDrawings: [Animation] = [] {
        didSet {
            arrayOfBestDrawings = arrayOfGalleryDrawings
            arrayOfBestDrawings.sort {
                $0.userRating > $1.userRating
            }
            bestDrawingsCollectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bestDrawingsCollectionView.dataSource = self
        bestDrawingsCollectionView.delegate = self
        galleryDrawingTableView.dataSource = self
        galleryDrawingTableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addDrawingVC = segue.destination as? AddViewController {
            addDrawingVC.addDrawingVCDelegate = self
            addDrawingVC.isMovie = false
        }
    }
}
extension DrawingsViewController: DrawingsVCDelegate {
    func addDrawing(_ drawing: Animation) {
        self.arrayOfGalleryDrawings.append(drawing)
        self.galleryDrawingTableView.reloadData()
    }
}
