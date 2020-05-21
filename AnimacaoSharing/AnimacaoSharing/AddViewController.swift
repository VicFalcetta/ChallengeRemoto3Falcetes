//
//  AddViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
 
    @IBAction func saveAnimationBarButtonIten(_ sender: Any) {
    }
    
    @IBAction func cancelAnimationBarButtonItem(_ sender: Any) {
    }
    
    @IBOutlet weak var addAnimationSearchBar: UISearchBar!
    @IBOutlet weak var posterAnimationImagemView: UIImageView!
    @IBOutlet weak var descriptionAnimationLabel: UILabel!

    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
