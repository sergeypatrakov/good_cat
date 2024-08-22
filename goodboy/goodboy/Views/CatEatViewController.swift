//
//  CatEatViewController.swift
//  goodboy
//
//  Created by Sergey Patrakov on 16.08.2024.
//

import UIKit

class CatEatViewController: UIViewController {
    
    lazy var button = UIButton(type: .system)
    lazy var image = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
    func setUpLayout() {
        configurateImage()
        configurateButton()
    }
    
    func configurateImage() {
        view.addSubview(image)
        image.image = UIImage(named: "catEyes")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3), // 1/3 от экрана
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configurateButton() {
        view.addSubview(button)
        button.backgroundColor = .lightGray
        button.setTitle("Я хочу рыбов 🐟", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(navigateToFishViewController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func navigateToFishViewController() {
        let fishViewController = FishViewController()
        navigationController?.pushViewController(fishViewController, animated: true)
    }

}
