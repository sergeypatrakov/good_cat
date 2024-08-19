//
//  ViewController.swift
//  goodboy
//
//  Created by Sergey Patrakov on 16.08.2024.
//

import UIKit

class ViewController: UIViewController {

    lazy var text = UILabel()
    lazy var button = UIButton(type: .system)
    lazy var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
    func setUpLayout() {
        configureImage()
        configureText()
        configureButton()
    }
    
    func configureImage() {
        view.addSubview(image)
        image.image = UIImage(named: "defaultcat")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3), // 1/3 от экрана
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configureText() {
        view.addSubview(text)
        text.text = "Привет! Данное приложение позволяет тебе взаимодействовать с котиками 😻"
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configureButton() {
        view.addSubview(button)
        button.backgroundColor = .black
        button.setTitle("Попробуй нажать сюда)", for: .normal)
        text.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func buttonPressed() {
        text.text = "Может покормим котика? \nДля этого нажми на него"
        text.textAlignment = .center
    }
}

