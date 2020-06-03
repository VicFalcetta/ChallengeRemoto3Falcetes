//
//  OnboardingViewController.swift
//  AnimacaoSharing
//
//  Created by Victor Falcetta do Nascimento on 01/06/20.
//  Copyright © 2020 Victor Falcetta do Nascimento. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollOnboarding: UIScrollView!
    @IBOutlet weak var pageControlOnboarding: UIPageControl!
    @IBOutlet weak var buttonOnboarding: UIButton!
    //Criando as variaveis da largura e altura
    var scrollWidth: CGFloat = 0.0
    var scrollHeight: CGFloat = 0.0
    //Dados que serão apresentados no Onboarding de tutorial
    let titles: [String] = ["Welcome to AnimU", "Add animations to your list!", "See their plot and info!"]
    let descriptions: [String] = ["AnimU is an app that helps you keep track of which animated movies or series that you have watched.",
                                  "With AnimU you can register an animation to a list of movies or TV series. Just touch on the '+' icon!",
                                  "To see more info about the animation that you added touch on the cell in the table!"]
    let images: [String] = ["onboarding_1", "onboarding_2", "onboarding_3"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

    //Pegando de forma dinâmica a largura e altura da scroll
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollOnboarding.frame.size.width
        scrollHeight = scrollOnboarding.frame.size.height
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        self.view.layoutIfNeeded()
        scrollOnboarding.delegate = self
        scrollOnboarding.isPagingEnabled = true
        scrollOnboarding.showsVerticalScrollIndicator = false
        scrollOnboarding.showsHorizontalScrollIndicator = false
        displayedView()
        //Mudando o tamanho para caber as views criadas dentro da scroll
        scrollOnboarding.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        //Disabilitando o scroll vertical
        self.scrollOnboarding.contentSize.height = 1.0
        pageControlOnboarding.numberOfPages = titles.count
        pageControlOnboarding.currentPage = 0
    }
    @IBAction func pageChanged(_ sender: Any) {
        scrollOnboarding!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat((pageControlOnboarding?.currentPage)!),
                                                     y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    @IBAction func buttonGetStarted(_ sender: UIButton) {
        Onboarding.shared.setIsNotNewUser()
        dismiss(animated: true, completion: nil)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndicatorForCurrentPage()
        if pageControlOnboarding.currentPage == 2 {
            buttonOnboarding.isHidden = false
        } else {
            buttonOnboarding.isHidden = true
        }
    }
    func setIndicatorForCurrentPage() {
        let page = (scrollOnboarding?.contentOffset.x)! / scrollWidth
        pageControlOnboarding?.currentPage = Int(page)
    }
    func displayedView() {
        //Criar a view que será apresentada
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            let slide = UIView(frame: frame)
            //Adicionando as subviews para o slide do onboarding
            let imageView = UIImageView.init(image: UIImage.init(named: images[index]))
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x: scrollWidth/2, y: scrollHeight/2 - 50)
            //Criando a label de titulo
            let txtTitle = UILabel.init(frame: CGRect(x: 32, y: imageView.frame.maxY + 30, width: scrollWidth - 64, height: 40))
            txtTitle.textAlignment = .center
            txtTitle.font = UIFont.boldSystemFont(ofSize: 24)
            txtTitle.text = titles[index]
            txtTitle.textColor = #colorLiteral(red: 0.07843137255, green: 1, blue: 0.9254901961, alpha: 1)
            txtTitle.numberOfLines = 0
            //Criando a label de texto
            let txtDescription = UILabel.init(frame: CGRect(x: 32, y: txtTitle.frame.maxY + 16, width: scrollWidth - 64, height: 80))
            txtDescription.textAlignment = .center
            txtDescription.numberOfLines = 0
            txtDescription.font = UIFont.systemFont(ofSize: 18)
            txtDescription.text = descriptions[index]
            //Adicionando as subviews
            slide.addSubview(imageView)
            slide.addSubview(txtTitle)
            slide.addSubview(txtDescription)
            scrollOnboarding.addSubview(slide)
        }
        setButtonOnboarding()
    }
    func setButtonOnboarding() {
        buttonOnboarding.setTitleColor(#colorLiteral(red: 0.07843137255, green: 1, blue: 0.9254901961, alpha: 1), for: .normal)
        buttonOnboarding.backgroundColor = .clear
        buttonOnboarding.setTitle("Get Started", for: .normal)
        buttonOnboarding.isHidden = true
        buttonOnboarding.layer.cornerRadius = 5
        buttonOnboarding.layer.borderWidth = 3
        buttonOnboarding.layer.borderColor = #colorLiteral(red: 0.07843137255, green: 1, blue: 0.9254901961, alpha: 1)
        buttonOnboarding.layer.masksToBounds = true
    }

}
