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
    @IBAction func testeAPI(_ sender: Any) {
    }
    var movies = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnimationSearchBar.delegate = self
    }
    func formatToQueryString(_ string: String) -> String {
        return string.components(separatedBy: " ").joined(separator: "%20")
    }
    func searchAnimation(named name: String) {
        let queryStr = formatToQueryString(name)
        let fullURL = "https://www.omdbapi.com/?apikey=\(APIKEY)&s=\(queryStr)"
        DispatchQueue.main.async {
            guard let urlRequest = URL(string: fullURL),
                let data = try? Data(contentsOf: urlRequest) else { return }
            if let search = try? JSONDecoder().decode(Search.self, from: data) {
                self.movies = search.movies
                self.descriptionAnimationLabel.text = self.movies.first?.title
            } else {
                print("Erro ao trazer filmes")
            }
        }
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
