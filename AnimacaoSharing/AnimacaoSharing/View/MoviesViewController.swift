//
//  ViewController.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 18/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var bestMoviesCollectionView: UICollectionView!
    @IBOutlet weak var galleryMoviesTableView: UITableView!

    var movies = [Movie]()
    var arrayOfBestMovies = ["Um","Dois","Tres","Quatro","Cinco"]
    var arrayOfGalleryMovies = ["Um","Dois","Tres","Quatro","Cinco"]

    override func viewDidLoad() {
        super.viewDidLoad()
        bestMoviesCollectionView.delegate = self
        bestMoviesCollectionView.dataSource = self
        overrideUserInterfaceStyle = .dark 
    }
}
