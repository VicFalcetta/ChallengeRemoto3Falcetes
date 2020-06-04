//
//  DrawingsViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit
import CloudKit

class DrawingsViewController: UIViewController {

    @IBOutlet weak var drawingSearchBar: UISearchBar!
    @IBOutlet weak var bestDrawingsCollectionView: UICollectionView!
    @IBOutlet weak var galleryDrawingTableView: UITableView!
    @IBAction func refreshPageBarButtonItem(_ sender: Any) {
        self.queryDrawing()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        bestDrawingsCollectionView.dataSource = self
        bestDrawingsCollectionView.delegate = self
        galleryDrawingTableView.dataSource = self
        galleryDrawingTableView.delegate = self
        queryDrawing()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addDrawingVC = segue.destination as? AddViewController {
            addDrawingVC.addDrawingVCDelegate = self
            addDrawingVC.isMovie = false
        }
    }
    func queryDrawing() {
        let query = CKQuery(recordType: "Drawing", predicate: NSPredicate(value: true))
        Animation.database.perform(query, inZoneWith: nil) { (record, error) in
            if let erro = error {
                fatalError(erro.localizedDescription)
            } else {
                guard let records = record else { return }
                Animation.animations = records
                DispatchQueue.main.async {
                    self.galleryDrawingTableView.reloadData()
                    self.bestDrawingsCollectionView.reloadData()
                }
            }
        }
    }
}
