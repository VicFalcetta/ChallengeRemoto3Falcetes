//
//  AddViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit
import CloudKit

class AddViewController: UIViewController {

    let container = CKContainer.init(identifier: "iCloud.ChallengeFalcetes")
    lazy var dataBase = container.privateCloudDatabase

    @IBAction func saveAnimationBarButtonIten(_ sender: Any) {

        let animation = CKRecord(recordType: "Animation")

        animation.setValue(addAnimationSearchBar.text, forKey: "Name")
        animation.setValue(noteAnimationTextField.text, forKey: "Note")

        dataBase.save(animation) { (record, error) in
            if let erro = error {
                fatalError(erro.localizedDescription)
            } else {
                let nome = record?.value(forKey: "Name")
            }
        }
    }

    @IBAction func cancelAnimationBarButtonItem(_ sender: Any) {
    }

    @IBOutlet weak var addAnimationSearchBar: UISearchBar!
    @IBOutlet weak var posterAnimationImagemView: UIImageView!
    @IBOutlet weak var descriptionAnimationLabel: UILabel!
    @IBOutlet weak var noteAnimationTextField: UITextField!

    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        addAnimationSearchBar.delegate = self
    }

    func formatToQueryString(_ string: String) -> String {
        return string.components(separatedBy: " ").joined(separator: "%20")
    }

    func searchAnimation(named name: String) {
        let queryStr = formatToQueryString(name)
        let fullURL = "https://www.omdbapi.com/?apikey=\(APIKEY)&t=\(queryStr)"
        DispatchQueue.main.async {
            guard let urlRequest = URL(string: fullURL),
                let data = try? Data(contentsOf: urlRequest) else { return }
            if let movie = try? JSONDecoder().decode(Movie.self, from: data) {
                self.movie = movie
                self.fillAddScreen()
            } else {
                print("Erro ao trazer filmes")
            }
        }
    }

    func fillAddScreen() {
        guard let movie = movie else { return }
        posterAnimationImagemView.load(imgUrl: movie.poster)
        descriptionAnimationLabel.text = movie.plot
    }
}

extension AddViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text,
            text.trimmingCharacters(in: .whitespacesAndNewlines) != "" else { return }
        let name = text.trimmingCharacters(in: .whitespacesAndNewlines)
        searchAnimation(named: name)
    }
}
