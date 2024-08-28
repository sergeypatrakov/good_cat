//
//  CatEatViewController.swift
//  goodboy
//
//  Created by Sergey Patrakov on 16.08.2024.
//

import UIKit

class CatEatViewController: UIViewController {
    
    lazy var text = UILabel()
    lazy var button = UIButton()
    lazy var image = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
    func setUpLayout() {
        view.backgroundColor = .white
        configurateImage()
        configureText()
        configurateButton()
    }
    
    func configureText() {
        view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Я хочу рыбов 🐟"
        text.numberOfLines = 0
        text.textAlignment = .center
        
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    func configurateImage() {
        view.addSubview(image)
        image.image = UIImage(named: "catEyes")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configurateButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Дать котику рыбов", for: .normal)
        
        button.goNextView()
        button.addTarget(self, action: #selector(navigateToFishViewController), for: .touchUpInside)
    
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func navigateToFishViewController() {
        let controller = FishViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}
