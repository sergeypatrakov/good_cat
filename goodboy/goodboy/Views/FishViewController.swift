//
//  FishViewController.swift
//  goodboy
//
//  Created by Sergey Patrakov on 16.08.2024.
//

import UIKit

class FishViewController: UIViewController {
    
    lazy var text = UILabel()
    lazy var button = UIButton()
    lazy var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
    }
    
    func setUpLayout() {
        configurateImage()
        configurateButton()
        configurateText()
    }
    
    func configurateImage() {
        view.addSubview(image)
        image.image = UIImage(named: "fish")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4), // 1/3 от экрана
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configurateText() {
        view.addSubview(text)
        text.text = "Что-то я уже не хочу кушать, может ты меня просто погладишь?"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configurateButton() {
        view.addSubview(button)
        button.setTitle("Погладить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.goNextView()
        button.addTarget(self, action: #selector(navigateToFinalViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func navigateToFinalViewController() {
        let controller = FinalViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
