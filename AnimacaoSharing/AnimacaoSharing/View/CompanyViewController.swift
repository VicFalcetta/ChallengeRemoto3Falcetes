//
//  CompanyViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {

    @IBOutlet weak var logoCompanyImagemView: UIImageView!

    @IBOutlet weak var nameCompanyLabel: UILabel!

    @IBOutlet weak var countryCompanyLabel: UILabel!

    @IBOutlet weak var foundationCompanyLabel: UILabel!

    @IBOutlet weak var awardsCompanyCollectionView: UICollectionView!

    @IBOutlet weak var companyWatchedMoviesCollectionView: UICollectionView!

    override func viewDidLoad() {
    super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
    }
}
