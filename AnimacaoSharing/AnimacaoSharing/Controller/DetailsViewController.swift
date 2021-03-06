//
//  DetailsViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var posterAnimationDetailsImageView: UIImageView!
    @IBOutlet weak var nameAnimationDetailsLabel: UILabel!
    @IBOutlet weak var producerAnimationDetailsLabel: UILabel!
    @IBOutlet weak var launchAnimationDetailsLabel: UILabel!
    @IBOutlet weak var genreAnimationDetailsCollectionView: UICollectionView!
    @IBOutlet weak var descriptionAnimationDetailsLabel: UILabel!
    var poster, name, launchDate, plotDescription,
        genre, producer: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        // Carregando elementos da view
        guard let posterImg = poster else { return }
        posterAnimationDetailsImageView.load(imgUrl: posterImg)
        nameAnimationDetailsLabel.text = name
        launchAnimationDetailsLabel.text = launchDate
        descriptionAnimationDetailsLabel.text = plotDescription
    }
    @IBAction func closeDetail(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
