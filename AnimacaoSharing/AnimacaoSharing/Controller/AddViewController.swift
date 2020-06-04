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
    /* Funcao do botao para adicionar a animacao. Se vier da tela de filmes, adicionará na tela de filmes.
    Se não vier da tela de filmes, irá adicionar uma animacao na tela de series. */
    @IBAction func saveAnimationBarButtonIten(_ sender: Any) {
        guard let movie = movie else { return }
        guard let userRating = noteAnimationTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        let newAnimation: Animation = Animation.createAnimation(movie: movie, userRating: userRating)
        if isMovie == true {
            addMovieVCDelegate?.addMovie(newAnimation)
        } else {
            addDrawingVCDelegate?.addDrawing(newAnimation)
        }
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
        descriptionAnimationLabel.textAlignment = .center
        descriptionAnimationLabel.text = "Type the name in the search bar as accurate as possible to find you animation! Remember to put your rating before saving!"
        noteAnimationTextField.isHidden = true
    }

    // Funcao de formatacao de string, nesse caso substituindo os "%20" da query por espacos em branco
    func formatToQueryString(_ string: String) -> String {
        return string.components(separatedBy: " ").joined(separator: "%20")
    }

    // Declaracao da funcao que procurará a animacao. Ela recebe o nome da animacao e depois a procura pelo nome
    func searchAnimation(named name: String) {
        /* Condicional que checa se o que será pesquisado é um filme ou uma série animada.
        A diferenca entre as requests, além de separar por movie ou series na url, garante que o json retornara um ou o outro dependendo da request.
        Isso ajuda pois garante objetos Animation tenham o valor da variavel "type" diferentes quando são filmes ou series animadas.
        */
        if isMovie == true {
            let queryStr = formatToQueryString(name)
            let fullURL = "https://www.omdbapi.com/?apikey=\(APIKEY)&t=\(queryStr)&type=movie"
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
        } else {
            let queryStr = formatToQueryString(name)
            let fullURL = "https://www.omdbapi.com/?apikey=\(APIKEY)&t=\(queryStr)&type=series"
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
    }
    //Funcao que preenche a tela de adicionar com as info do filme
    func fillAddScreen() {
        guard let movie = movie else { return }
        posterAnimationImagemView.load(imgUrl: movie.poster)
        descriptionAnimationLabel.textAlignment = .left
        descriptionAnimationLabel.text = movie.plot
        noteAnimationTextField.isHidden = false
    }
}
//Delegate que faz a search bar funcionar
extension AddViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text,
            text.trimmingCharacters(in: .whitespacesAndNewlines) != "" else { return }
        let name = text.trimmingCharacters(in: .whitespacesAndNewlines)
        searchAnimation(named: name)
        searchBar.resignFirstResponder()
    }
}
extension AddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
