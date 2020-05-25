//
//  ProfileViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var photographProfileImageView: UIImageView!
    @IBOutlet weak var nameProfileLabel: UILabel!

    @IBOutlet weak var totalMoviesProfileLabel: UILabel!
    @IBOutlet weak var totalDrawingProfileLabel: UILabel!

    @IBOutlet weak var firstFavoriteCategoryProfileImageView: UIImageView!
    @IBOutlet weak var secondFavoriteCategoryProfileImageView: UIImageView!
    @IBOutlet weak var thirdFavoriteCategoryProfileImageView: UIImageView!
    @IBOutlet weak var firstFavoriteCategoryProfileLabel: UILabel!
    @IBOutlet weak var secondFavoriteCategoryProfileLabel: UILabel!
    @IBOutlet weak var thirdFavoriteCategoryProfileLabel: UILabel!

    @IBOutlet weak var watchedMoviesCollectionView: UICollectionView!
    @IBOutlet weak var watchedDrawingCollectionView: UICollectionView!

    var arrayOfWatchedMovies = ["Um","Dois","Tres","Quatro","Cinco"]
    var arrayOfWatchedDrawing = ["Um","Dois","Tres","Quatro","Cinco"]

        override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
    }
}
