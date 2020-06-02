//
//  EditProfileViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 25/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBAction func photoPersonButton(_ sender: Any) {
    }

    @IBOutlet weak var namePersonTextField: UITextField!

    @IBOutlet weak var favoriteGenrePersonCollectionView: UICollectionView!

    override func viewDidLoad() {
    super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
    }
}
