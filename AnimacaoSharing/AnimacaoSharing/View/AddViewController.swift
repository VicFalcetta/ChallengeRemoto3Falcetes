//
//  AddViewController.swift
//  AnimacaoSharing
//
//  Created by Rayane Xavier on 21/05/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    weak var addMovieVCDelegate: MoviesVCDelegate?
    weak var addDrawingVCDelegate: DrawingsVCDelegate?
    var isMovie: Bool = false

    @IBAction func saveAnimationBarButtonIten(_ sender: Any) {

//        guard let movie = movie else { return }
        guard (noteAnimationTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)) != nil else { return }
//        let newAnimation: Animation = Animation.createAnimation(movie: movie, userRating: userRating)
//        if isMovie == true {
//            addMovieVCDelegate?.addMovie(newAnimation)
//        } else {
//            addDrawingVCDelegate?.addDrawing(newAnimation)
//        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelAnimationBarButtonItem(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var addAnimationSearchBar: UISearchBar!
    @IBOutlet weak var posterAnimationImagemView: UIImageView!
    @IBOutlet weak var descriptionAnimationLabel: UILabel!
    @IBOutlet weak var noteAnimationTextField: UITextField!

    var movie: MovieAPI?

    override func viewDidLoad() {
        super.viewDidLoad()
        addAnimationSearchBar.delegate = self
        overrideUserInterfaceStyle = .dark
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
            if let movie = try? JSONDecoder().decode(MovieAPI.self, from: data) {
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
