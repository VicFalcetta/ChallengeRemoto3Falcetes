//
//  DrawingsViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class DrawingsViewController: UIViewController {

    @IBOutlet weak var drawingSearchBar: UISearchBar!
    @IBOutlet weak var bestDrawingsCollectionView: UICollectionView!
    @IBOutlet weak var galleryDrawingTableView: UITableView!

    var arrayOfDrawingsMovies = ["Um","Dois","Tres","Quatro","Cinco"]
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}