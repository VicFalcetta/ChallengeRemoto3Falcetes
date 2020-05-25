//
//  ViewController.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 18/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

protocol MoviesVCDelegate: AnyObject {
    func addMovie (_ movie: Animation)
}

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var bestMoviesCollectionView: UICollectionView!
    @IBOutlet weak var galleryMoviesTableView: UITableView!
    var arrayOfBestMovies: [Animation] = []
    var arrayOfGalleryMovies: [Animation] = [] {
        didSet {
            arrayOfBestMovies = arrayOfGalleryMovies
            arrayOfBestMovies.sort {
                $0.userRating > $1.userRating
            }
            bestMoviesCollectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bestMoviesCollectionView.delegate = self
        bestMoviesCollectionView.dataSource = self
        galleryMoviesTableView.dataSource = self
        galleryMoviesTableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addMovieVC = segue.destination as? AddViewController {
            addMovieVC.addMovieVCDelegate = self
            addMovieVC.isMovie = true
        }
    }
}

extension MoviesViewController: MoviesVCDelegate {
    func addMovie(_ movie: Animation) {
        self.arrayOfGalleryMovies.append(movie)
        self.galleryMoviesTableView.reloadData()
    }
}
